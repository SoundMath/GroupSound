from sys import exit
import numpy
import wave

def translation(els, f, y):
    """return the function f translated by y.
    
    Args:
        els -- a list of elements of a group (that index the function f).
        f -- a list of real numbers (of length equal to that of els).
        y -- an element of the group.
        
    Returns:
        a list that is a translated version of the input signal f.
        
    Example:
        f = [0]*8
        f[1]=1      # an impulse at 1
        g = CyclicPermutationGroup(N)
        els = g.list()
        translation(els,f,els[4])  # translate f by 5th element in list els
    """
    
    if (len(els) != len(f)):
        raise Exception("Signal length must be equal to order of group")
    z = y^-1
    N = len(els)
    Tfy = [None]*N
    for k in range(N):
        Tfy[k] = f[els.index(z*els[k])]
    
    return Tfy
    
def prodTranslation(f, g, els, k):
    x = f[k]
    y = translation(els,g,els[k])
    return [x * y1 for y1 in y]
    
    
def bruteConvolution(els, f, g):
    """return the group convolution of g by f.
    
    Args:
        els -- a list of all elements of a group, G.
        f -- a list of real numbers of length |G|.
        g -- a list of real numbers of length |G|.
        

    Returns:
        list of reals that is the group convolution of g by f.
        
    Notes:
        We currently use map and reduce, but this may be 
        slow when compared to a fft/ifft algorithm.  http://www.sagemath.org/doc/reference/plotting/sage/plot/plot.html
        We should implement it both ways and determine the 
        respective complexities of the two algorithms.
    """
    N = len(els)
    if (N != len(g) or N != len(f)):
        raise Exception("Length of input functions must match the order of the group.")
    weightedTranslations = [None]*N
    for k in range(N):
        weightedTranslations[k] = prodTranslation(f,g,els,k)
    
    #print("weightedTranslations length:", len(weightedTranslations))
    retvals = [sum(i) for i in zip(*weightedTranslations)]
    #print("reduce length: ", len(retvals))
    return retvals
    
def mrConvolution(els, f, g):
    """return the group convolution of g by f.
    
    Args:
        els -- a list of all elements of a group, G.
        f -- a list of real numbers of length |G|.
        g -- a list of real numbers of length |G|.
        
    Returns:
        list of reals that is the group convolution of g by f.
        
    Notes:
        We currently use map and reduce, but this may be 
        slow when compared to a fft/ifft algorithm.  
        We should implement it both ways and determine the 
        respective complexities of the two algorithms.
    """
    N = len(els)
    if (N != len(g) or N != len(f)):
        raise Exception("Length of input functions must match the order of the group.")
    
    weightedTranslations = map(lambda k: f[k]*translation(els, g, els[k]), range(len(els)))
    print("weightedTranslations length:", len(weightedTranslations))
    retvals = reduce(lambda x, y: x+y, weightedTranslations)
    print("reduce length: ", len(retvals))
    return retvals


def createWav(sig,sr,sl,name):
    '''Convert a signal to wav format and write it to a file.
    
    Args:
        sig -- list of signal values
        sr -- sample rate
        sl -- number of frames (signal length)
        name -- name of wav file to be created
        
    Raises:
        A generic exception.
    '''
    if(len(sig)!=sl):
        print("# of sig vals:",len(sig))
        print("number of frames: ",sl)
        raise Exception("number of signal values must match number of frames")
    maxsig = max(sig)
    sfx = [16384*x/maxsig for x in sig]
    bits = ''.join(wave.struct.pack('h',x) for x in sfx)
    wavfile = wave.open(name + '.wav','wb')
    wavfile.setparams((1,2,sr,sl,'NONE', 'noncompressed'))
    wavfile.writeframes(bits)
    wavfile.close()
    
def impulseAndLine(N):
    '''return two lists, the first is an impulse, the second a line.
    Args:
        N -- length of the lists returned.
    Returns:
        f, g -- two lists, an impulse and a line, respectively.
    '''
    f = [0]*N
    f[N/2]=1   # an impulse at N/2 
    g = [x/N for x in range(N)]  # a line
    return f, g

def displayTranslations(els,f):
    '''pretty print the translations of f by each element in els
    
    Args:
        els -- a list of elements of a group
        f -- a list of real numbers
    '''
    if (len(els)!=len(f)):
        raise Exception("input lists must be of same length")
    print "list of group elements: \n", els
    print "\nOriginal function f: ", f
    print "\nTranslates of function: "
    for i in range(len(f)):
        print i, "* f: ", translation(els,f,els[i])



class GroupDSP:
    def __init__(self,els):
        self.els = els
        self.size = len(els)
        self.inverses = []
        self.mult_table=[]
        for x in range(self.size):
            self.inverses.append(els[x]^-1)
            self.mult_table.append([])
            for y in range(self.size):
                self.mult_table[x].append(els[x]*els[y])
        
   
    def translation(self,f,y):
        if(self.size != len(f)):
            raise Exception("Signal length must be equal to order of group")
        z = self.inverses[self.els.index(y)]
        Tfy = [None]*self.size
        for k in range(self.size):
            Tfy[k] = f[self.els.index(z*self.els[k])]
           
        return Tfy
       
    def prodTranslation(self,f,g,k):
        x = f[k]
        #print(els[k])
        y = self.translation(g,self.els[k])
        return [x * y1 for y1 in y]
       
    def bruteConvolution(self, f, g):
        if(self.size != len(f) or self.size != len(g)):
            raise Exception("Length of input functions must match the order of the group")
        
        weightedTranslations = [None]*self.size
        for k in range(self.size):
            weightedTranslations[k] = self.prodTranslation(f,g,k)
        
        retvals = [sum(i) for i in zip(*weightedTranslations)]
        return retvals
           
    
    
        weightedTranslations = [None]*self.size
        for k in range(self.size):
            weightedTranslations[k] = self.prodTranslation(f,g,k)
        
        retvals = [sum(i) for i in zip(*weightedTranslations)]
        return retvals



'''Fast convolution for semidirect product groups of the form C_n:C_2'''
def SdpConvolution(u, v, gp):
    ''' Convolution of 1-dimensional signals over the semidirect product
        group C_n:C_2.

    Args:
        u -- 1D array (signal)
        v -- 1D array (signal) of same length as u
        gp -- (int) indicates which group action to use in semidirect product.

    Returns:
        y -- 1D array (signal) stores resulting convolution product.

    Remarks:
        The key operation which distinguishes the convolution
             C(u)v = sum_x u(x) T(x) v
        over different groups is the translation $T(x) v$.

    See also: cn_2.m in GroupSound/src/Matlab/Documented directory.
    '''
    if (len(u) != len(v)):
        raise Exception("not implemented: input lists must be same length")
        # TODO: accommodate signals of different length

    if (gp!=1):
        raise Exception("not implemented: gp must be 1")
        # TODO: implement other groups

    n2 = len(u)    # signal length: 2*n
    n = n2/2       # signal half-length: n
    nn = range(n)  # {0, 1, ..., n-1}
    rn = indexset(n, gp);
    uu2 = [u[rn[k]+n] for k in range(n)]
    uu = u[:n] + uu2  # concatenation

    [u1, u2] = SdpTransform(uu, gp)  # matlab: [u1,u2]=n_2(uu(:,1),gp);
    [v1, v2] = SdpTransform(v, gp)   # matlab: [v1,v2]=n_2(v(:,1),gp);


    # matlab: c1 = u2(1:n).*v2(1:n) + u2(1+n:n2).*v2(1+n:n2) + sqrt(2)*u1(1:n).*v1(1:n);
    uhvh2 = pprod( u2[:n], v2[:n] )
    utvt2 = pprod( u2[n:], v2[n:] )
    uhvh1 = scalarMultiple( math.sqrt(2), pprod( u1[:n], v1[:n] ) )
    c1 = ppsum( [uhvh2, utvt2, uhvh1 ] )  # point-wise sum of three vectors

    # matlab: c2 = u2(1+n:n2).*v2(1:n) + u2(1:n).*v2(1+n:n2) + sqrt(2)*u1(1+n:n2).*v1(1+n:n2);
    utvh2 = pprod( u2[n:], v2[:n] )
    uhvt2 = pprod( u2[:n], v2[n:] )
    utvt1 = scalarMultiple(math.sqrt(2), pprod( u1[n:], v1[n:] ) )
    c2 = ppsum( [utvh2, uhvt2, utvt1] )

    c = c1 + c2  # concatenation

    # matlab: return sqrt(n)*in_2(c,gp);
    return scalarMultiple( math.sqrt(n), inverseSdpTransform(c, gp) )


def SdpTransform(f,gp):
    '''Semidirect product transform.
    Args:
        f -- signal whose expansion coefs will be computed.
        gp -- (int) indicates which group action to use in semidirect product.

    Returns:
        y1 -- expansion coefs of signal wrt semidirect product group C_N:C_2.
        y2 -- ???

    Remarks:
        o  For input signal f, SdpTransform(f,gp) computes expansion coefficients 
           wrt semidirect product group C_N:C_2 where input argument 
           gp specifies the action group C_2.
        o  Use this for abelian by abelian semidirect product groups 
           of the form C_N:C_2, where N is even and C_2 = {1, k}.
        o  Signals are indexed by the elements of C_N:C_2,
           ordered as follows:
           \[ 
           C_N:C_2 = {1,x,...,x^{N-1}, k,xk,...,x^{N-1}k} 
           \]
        o  The argument gp specifies the "action" group to which 
           C_2 = {1, k} corresponds. Possible group actions are: 
                gp=1:  x --> x^{-1}
                gp=2:  x^k --> x^{(m+1)k}
                gp=3:  x^k --> x^{(m-1)k}

    See also: matlab program n_2.m
    '''
    n2 = len(f)              # signal length: 2*n
    if (n2%2 != 0):
        raise Exception("not implemented: signal length must be even")
        # TODO: accommodate signals of odd length

    if (gp!=1):
        raise Exception("not implemented: gp must be 1")
        # TODO: implement other groups

    n = n2/2                 # signal half-length: n
    m = n/2                  # signal quarter-length: n/2
    nn = range(n)            # {0, 1, ..., N-1}
    rt2 = 1/math.sqrt(2)
    y1 = n2*[0]

    # Take ifft of first half of signal:
    bf1 = scalarMultiple( math.sqrt(n), numpy.fft.ifft(f[:n]) )
    # Take ifft of second half of signal:
    bf2 = scalarMultiple( math.sqrt(n), numpy.fft.ifft(f[n:]) )
    # Concatenate the results:
    bf = bf1 + bf2  

    if len(y1) != len(bf):
        raise Exception("somethings wrong: bf and y1 should have same length")

    if (gp==1):    # x --> x^{-1}
        d1 = 2
        c1 = [0, m]

    if (gp==2):    # x^k --> x^{(m+1)k}
        raise Exception("not implemented: gp must be 1")
        # TODO: implement other groups
        # d1 = m
        # c1 = 2*range(m)

    if (gp==3):    # x^k --> x^{(m-1)k}
        raise Exception("not implemented: gp must be 1")
        # TODO: implement other groups
        # d1 = 2
        # c1 = [0, m-2]

    # WARNING: the indices used here might be the wrong ones!
    t1 = 1/math.sqrt(2) * (bf[0] + bf[n])
    t2 = 1/math.sqrt(2) * (bf[0] - bf[n])
    bf[0] = t1
    bf[n] = t2
    y1[0] = t1
    y1[n] = t2

    t1 = 1/math.sqrt(2) * ( bf[m] + bf[m+n] )
    t2 = 1/math.sqrt(2) * ( bf[m] - bf[m+n] )
    bf[m] = t1
    bf[m+n] = t2
    y1[m] = t1
    y1[m+n] = t2

    # For now, we've just implemented a special case, so we don't need
    # this more general for loop:
    #   for k in range(d1):
    #       t1 = rt2 * ( bf[c1[k]] + bf[c1[k]+n] )
    #       t2 = rt2 * ( bf[c1[k]] - bf[c1[k]+n] )
    #       bf[c1[k]] = t1
    #       bf[c1[k]+n] = t2
    #       y1[c1[k]] = t1
    #       y1[c1[k]+n] = t2


    # matlab:
    # t1=rt2*(bf(c1(k))+bf(c1(k)+n));
    # t2=rt2*(bf(c1(k))-bf(c1(k)+n));
    # bf(c1(k))=t1;
    # bf(c1(k)+n)=t2;
    # y1(c1(k))=t1;
    # y1(c1(k)+n)=t2;

    return y1, pdiff(bf, y1)


# TODO: implement the in_2 function!
def inverseSdpTransform(y, gp):
    ''' Inverse semidirect product transform.
    Args:
        y -- expansion coefficients of a signal wrt semidirect product group C_N:C_2.
        gp -- (int) indicates which group action to use in semidirect product.

    Returns:
        f -- signal for which y holds expansion coefficients wrt C_N:C_2.

    Remarks:
    o  Computes the inverse transform coefficients of a 1D signal 
       with respect to the semidirect product group $C_N \sdp C_2$.
       In other words, output f is the signal for which input y is 
       the set of expansion coefficients wrt the sdp group.
    o  Use this for abelian by abelian semidirect product groups 
       of the form $C_N \sdp C_2$, where N is even and $C_2 = \{1, k\}$.
    o  Signals are indexed by the elements of $C_N \sdp C_2$,
       ordered as follows:
       \[ 
         C_N:C_2 = \{ 1, x, ..., x^{N-1}, k, xk, ..., x^{N-1}k \} 
       \]
   o  The argument gp specifies the "action" group to which 
      $C_2 = \{1, k\}$ corresponds. Possible group actions are: 
                gp=1:  x --> x^{-1}
                gp=2:  x^k --> x^{(m+1)k}  (not yet implemented)
                gp=3:  x^k --> x^{(m-1)k}  (not yet implemented)

   o See also: the matlab program in_2.m.

    History:
    2001.04.02 -- original matlab program by Myoung An.
    2004.03.23 -- comments, minor mods/additions by williamdemeo@gmail.com.
    2014.07.25 -- python version by williamdemeo@gmail.com.
    '''
    n2 = len(y)              # signal length: 2*n
    if (n2%2 != 0):
        raise Exception("not implemented: signal length must be even")
        # TODO: accommodate signals of odd length

    if (gp!=1):
        raise Exception("not implemented: gp must be 1")
        # TODO: implement other groups

    n = n2/2             # $N$ : signal half-length
    m = n/2              # $N/2$ : signal quarter-length
    nn = range(n)        # $\{ 0, 1, ..., N-1 \}$
    rt2 = 1/math.sqrt(2)

    if (gp==1):           # x --> x^{-1}
        d1 = 2
        c1 = [0, m]

    if (gp==2):    # x^k --> x^{(m+1)k}
        raise Exception("not implemented: gp must be 1")
        # TODO: implement other groups
        # d1 = m
        # c1 = 2*range(m)

    if (gp==3):    # x^k --> x^{(m-1)k}
        raise Exception("not implemented: gp must be 1")
        # TODO: implement other groups
        # d1 = 2
        # c1 = [0, m-2]

    # for k in range(d1):
    #     t1 = y[c1[k]] + y[c1[k]+n]
    #     t2 = y[c1[k]] - y[c1[k]+n]
    #     y[c1[k]] = rt2 * t1
    #     y[c1[k]+n] = rt2 * t2

    t1 = y[0] + y[n]
    t2 = y[0] - y[n]
    y[0] = rt2 * t1
    y[n] = rt2 * t2

    t1 = y[m] + y[m+n]
    t2 = y[m] - y[m+n]
    y[m] = rt2 * t1
    y[m+n] = rt2 * t2

    # matlab: f1 = (1/sqrt(n))*fft(y(1:n));
    f1 = scalarMultiple( 1/math.sqrt(n), numpy.fft.fft( y[:n] ) )
    # matlab: f2 = (1/sqrt(n))*fft(y(1+n:n2));
    f2 = scalarMultiple( 1/math.sqrt(n), numpy.fft.fft( y[n:] ) )

    return f1 + f2



'''Some Utility functions'''

def indexset(n,gp):
    '''return a vector of indices ordered with respect to action group gp.'''  
    nn = range(n)      # {0,1,...,N-1}
    m = n/2            # signal quarter-length: N/2
    if (gp==1):        # x \mapsto x^{-1}
        rn = range(n-1,-1,-1)  # rn is now: {N-1, N-2, ..., 1, 0} 
        shiftInPlace(rn,1)     # rn is now: {0, N-1, N-2, ..., 2, 1} 
    if (gp==2):        # x^k \mapsto x^{(m+1)k}
        #rn = mod((m+1)*nn,n)+1;
        raise Exception("not implemented")
    if (gp==3):        # x^k \mapsto x^{(m-1)k}
        #rn=mod((m-1)*nn,n)+1;
        raise Exception("not implemented")
    return rn



def shiftInPlace(l, n):
    n = n % len(l)
    head = l[:n]
    l[:n] = []
    l.extend(head)
    return l



'''Point-wise sum of two vectors.'''
def psum(x, y):
    return map(lambda a, b: a+b, x, y) 


'''Point-wise sum of a vector of vectors.'''
def ppsum(X):
    if (len(X)==1):
        return X[0]
    else:
        return psum( X[0], ppsum(X[1:]) )


'''Point-wise product of two vectors.'''
def pprod(x, y):
    return map(lambda a, b: a*b, x, y) 


'''Point-wise difference of two vectors.'''
def pdiff(x, y):
    return map(lambda a, b: a-b, x, y) 


'''Scalar multiple of a vector.'''
def scalarMultiple(c, x):
    return map(lambda n: c*n, x) 
