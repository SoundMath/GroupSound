<style TYPE="text/css">
code.has-jax {font: inherit; font-size: 100%; background: inherit; border: inherit;}
</style>
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
    tex2jax: {
        inlineMath: [['$','$'], ['\\(','\\)']],
        skipTags: ['script', 'noscript', 'style', 'textarea', 'pre'] // removed 'code' entry
    }
});
MathJax.Hub.Queue(function() {
    var all = MathJax.Hub.getAllJax(), i;
    for(i = 0; i < all.length; i += 1) {
        all[i].SourceElement().parentNode.className += ' has-jax';
    }
});
</script>
<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

harmonics(K, f0, w)
-------------------
**FILE** harmonics.m  
**DESCRIPTION** generate a harmonic tone of length N = pow2(K+1)  
**INPUT**  
    K   N = pow2(K+1) is the length of the output signal
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
