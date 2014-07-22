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
