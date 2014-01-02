Group Sound
===========

This is the main repository for original research on the acoustical properties
of nonabelian group filters.   

--------------------------------------------

Research Team
--------------
Matthew Corley -- University of South Carolina (CS major)

William DeMeo -- University of South Carolina (Math faculty mentor)

Reginald Bain -- University of South Carolina (Music faculty mentor)

---------------------------------------------------

Abstract
--------
Underlying many digital signal processing (dsp) algorithms, in particular those
used for digital audio filters, is the convolution operation, which is a
weighted sum of translations f(x-y). Most classical results of dsp are easily
and elegantly derived if we define our functions on Z/nZ, the abelian group of
integers modulo n. If we replace this underlying "index set" with a nonabelian
group, then translation may be written f(y<sup>-1</sup>x), and the resulting audio
filters arising from convolution naturally produce different effects than those
obtained with ordinary (abelian group) convolution.  

The aim of this project is to explore the idea of using the underlying finite
group (i.e., the index set) as an adjustable parameter of a digital audio
filter. By listening to samples produced using various nonabelian groups, we try
to get a sense of the "acoustical characters" of finite groups. 

The main project webpage is at [soundmath.github.io/GroupSound](http://soundmath.github.io/GroupSound).

------------------------------------------------

News
----
+ (December 9, 2013) [Matt Corley](mailto:corleymj@email.sc.edu) is now a
  [Magellan Scholar](http://www.sc.edu/our/magellan.shtml) and a grant will fund
  his work on this project.  *Congratulations, Matt!*  
+ (October 18, 2013) [Our abstract][] was accepted; we will present preliminary
  results of this project at the [Joint Math Meetings][] in Baltimore, Maryland on 
  January 16, 2014 at 10:40am. **Event:** *At the Intersection of Mathematics and the Arts, III.*

----------------------------------------------------------

Related Resources
-----------------
1.  **Programming**  
    *Primary languages:* [Sage](http://sagemath.org),
    [GAP](http://gap-system.org/),
    [Octave](http://www.gnu.org/software/octave/),
    [Scala](http://www.scala-lang.org/);  
    *Others:*
    [CSound](http://www.csounds.com/),
    [Pure Data](http://puredata.info/),
    [Supercollider](http://supercollider.sourceforge.net/),
    [Chuck](http://chuck.cs.princeton.edu/).


2.  **Books, notes, and other references**  
    [Algebraic Signal Processing Theory](http://www.ece.cmu.edu/~smart/research.html)  
    [Music and Computers: a theoretical and historical approach](http://music.columbia.edu/cmc/MusicAndComputers/)
    by Burk, Polansky, Repetto, Roberts and Rockmore. 2011. 

3.  **Conferences**  
    [Joint Mathematics Meetings](http://jointmathematicsmeetings.org/jmm)  
    [New Interfaces for Musical Expression (NIME)](http://www.nime.org/nime2014/)  
    [International Symposium on Musical Acoustics (ISMA)](http://isma.univ-lemans.fr/en/index.html)  
    [International Computer Music Conference (ICMC)](http://www.computermusic.org/page/23/)  



[Our abstract]: https://github.com/SoundMath/GroupSound/raw/master/Conferences/AMSBaltimore2013/abstract.pdf
[Joint Math Meetings]: http://jointmathematicsmeetings.org/jmm
