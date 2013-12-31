# util

harmonics(K, f0, w)
-------------------
**FILE** harmonics.m  
**DESCRIPTION** generate a harmonic tone of length N = pow2(K+1)  
**INPUT**  

    K   the length of the output signal is N = pow2(K+1)
    f0  the base frequencies (unnormalized)
    w   (Boolean) if true, then write signals to files
	
**OUTPUT**  
    h   of size |f0| x N, where each row is a signal 
	
**NOTES**  
There is a hardcoded vector of amplitudes, currently,
    amps = .3*[.6 .4 .2 .5 .3 .4 .2 .4 .2 .2 .3];
and the signal at frequency $f$ is computes as follows:
for $k$ in 1:length(amps) let $\omega = k*f$ and
    sig = sig + amps(k).*exp((i*2*pi*((f/N).*n + rand)));

**EXAMPLE**  
**AUTHOR** [William DeMeo](mailto:williamdemeo@gmail.com)  
**DATE** 2013 Dec 30  
