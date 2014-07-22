from sys import exit
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


'''Fast convolution for semidirect product groups of the form C_n:C_2'''
def SdpConvolution(u, v, gp):
    ''' Convolution of 1-dimensional signals over the semidirect product
        group C_n:C_2.

    Args:
        u -- 1D array (signal)
        v -- 1D array (signal) of same length as u
        gp -- (int) indicates group wrtw convolution is performed

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
    rn = indexset(n,gp);
    uu = u[:n]     # first half of signal

    for k in range(n):
        uu[k+n]=u[rn[k]+n]

    [u1,u2]=SdpTransform(uu,gp)
    [v1,v2]=SdpTransform(v,gp)

    uhvh2 = pprod(u2[:n],v2[:n])
    utvt2 = pprod(u2[n:],v2[n:])
    uhvh1 = pprod(u1[:n],v1[:n])
    c1 = uhvh2 + utvt2 + scalarMultiple(math.sqrt(2), uhvh1)

    utvh2 = pprod(u2[n:],v2[:n])
    uhvt2 = pprod(u2[:n],v2[n:])
    utvt1 = pprod(u1[n:],v1[n:])
    c2 = utvh2 + uhvt2 + scalarMultiple(math.sqrt(2), utvt1)

    c = c1 + c2

    y = scalarMultiple(math.sqrt(n), in_2(c,gp))

    return y




def SdpTransform(f,gp):
    '''Semidirect product transform.
    Args:
        f -- signal whose expansion coefs will be computed.
        gp -- (int) indicates action group to use for C_2.

    Returns:
        y1 -- expansion coefs of signal wrt semidirect product group C_N:C_2.
        y2 -- ???

    Remarks:
        o  For input signal f, n_2(f,gp) computes expansion coefficients 
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
    y2 = n2*[0]
    bf = n2*[0]
    # Take ifft of first half of signal:
    bf[:n] = math.sqrt(n) * numpy.fft.ifft(f[:n])
    # Take ifft of second half of signal:
    bf[n:] = math.sqrt(n) * numpy.fft.ifft(f[n:]);

    if len(y1) != len(bf):
        raise Exception("somethings wrong: bf and y1 should have same length")

    if (gp==1):    # x --> x^{-1}
        d1 = 2
        c1 = [1, m+1]

    if (gp==2):    # x^k --> x^{(m+1)k}
        raise Exception("not implemented: gp must be 1")
        # TODO: implement other groups
        # d1 = m
        # c1 = 2*range(m)

    if (gp==3):    # x^k --> x^{(m-1)k}
        raise Exception("not implemented: gp must be 1")
        # TODO: implement other groups
        # d1 = 2
        # c1 = [1, m-1]

    for k in range(d1):
        t1 = rt2 * ( bf[c1[k]] + bf[c1[k]+n] )
        t2 = rt2 * ( bf[c1[k]] - bf[c1[k]+n] )
        bf[c1[k]] = t1
        bf[c1[k]+n] = t2
        y1[c1[k]] = t1
        y1[c1[k]+n] = t2

    if len(y1) != len(bf):
        raise Exception("somethings wrong: bf and y1 should have same size")

    return pdiff(bf, y1)


# TODO: implement the in_2 function!
function f=in_2(y,gp)
% Inverse semidirect product transform.
%
% INPUT
%   y & expansion coefficients of a signal wrt semidirect product group
%       $C_N \sdp C_2$.
%   gp & (int) indicates action group to use for $C_2$.
%
% OUTPUT
%   f & signal for which y holds expansion coefficients wrt $C_N \sdp C_2$.
%
% REMARKS
%   o  Computes the inverse transform coefficients of a 1D signal 
%      with respect to the semidirect product group $C_N \sdp C_2$.
%      In other words, output f is the signal for which input y is 
%      the set of expansion coefficients wrt the sdp group.
%   o  Use this for abelian by abelian semidirect product groups 
%      of the form $C_N \sdp C_2$, where N is even and $C_2 = \{1, k\}$.
%   o  Signals are indexed by the elements of $C_N \sdp C_2$,
%      ordered as follows:
%      \[ 
%        C_N \sdp C_2 = \{1,x,\ldots,x^{N-1}, k,xk,\ldots,x^{N-1}k\} 
%      \]
%   o  The argument gp specifies the "action" group to which 
%      $C_2 = \{1, k\}$ corresponds. Possible group actions are: 
%                gp=1:  x --> x^{-1}
%                gp=2:  x^k --> x^{(m+1)k}
%                gp=3:  x^k --> x^{(m-1)k}
%
% See also: n_2
%
%
% HISTORY
%   2001.04.02 & Myoung An     & original program
%   2004.03.23 & William DeMeo & comments, minor mods/additions
n2 = length(y);        % $2N$ : signal length
n=n2/2;                % $N$ : signal half-length
m=n/2;                 % $N/2$ : signal quarter-length
nn=(0:n-1);            % $\{0,1,\ldots,N-1\}$
rt2=1/sqrt(2);
if (gp==1)                % x --> x^{-1}
   d1 = 2;
   c1 = [1 m+1];
end   
if (gp==2)                % x^k --> x^{(m+1)k}
   d1 = m;
   c1 = 2*(1:m)-1;
end
if (gp==3)                % x^k --> x^{(m-1)k}
   d1 = 2;
   c1 = [1 m-1];
end
for k=1:d1
   t1=y(c1(k))+y(c1(k)+n);
   t2=y(c1(k))-y(c1(k)+n);
   y(c1(k))=rt2*t1;
   y(c1(k)+n)=rt2*t2;
end
f(1:n)=(1/sqrt(n))*fft(y(1:n));
f(1+n:n2)=(1/sqrt(n))*fft(y(1+n:n2));





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



'''Point-wise product of two vectors.'''
def pprod(x, y):
    return map(lambda a, b: a*b, x, y) 


'''Point-wise difference of two vectors.'''
def pdiff(x, y):
    return map(lambda a, b: a-b, x, y) 


'''Scalar multiple of a vector.'''
def scalarMultiple(c, x):
    return map(lambda n: c*n, x) 



