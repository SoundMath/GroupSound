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
+ (Feb 25, 2014) [Matt Corley][] gives a preliminary report on GroupSound at the
  spring Pi Mu Epsilon Math Honors Society initiation meeting.  
+ (Feb 17, 2014) Research team meeting in the [xMuse Experimental Music Studio][].  
+ (Feb 14, 2014) [Matt Corley][] adjusts map-reduce convolution to work for
  small audio samples. You can now listen to audio convolution by downloading
  the [Sage worksheet (experiements.sws)][].    
+ (Jan 16, 2014) [William DeMeo][] gives a preliminary report on the project at the MAA Session on the
  [Intersection of Mathematics and the Arts III][].   
+ (Jan 10, 2014) [William DeMeo][] develops a map-reduce algorithm for convolution over finite groups.
  Get the [Sage worksheet (GroupDSP.sws)][].  
+ (Jan 8, 2014) [Matt Corley][] develops Sage/Python routines for creating/playing sound signals and writing them to wav files. 
  Get the [Sage worksheet (wavwrite_examples.sws)][].   
+ (Dec 9, 2013) [Matt Corley][] is now a
  [Magellan Scholar](http://www.sc.edu/our/magellan.shtml) and a grant will fund
  his work on this project.  *Congratulations, Matt!*   
+ (Oct 18, 2013) [Our abstract][] was accepted; we will present preliminary
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
    + [Algebraic Signal Processing Theory](http://www.ece.cmu.edu/~smart/research.html)    
    + [Music and Computers: a theoretical and historical approach](http://music.columbia.edu/cmc/MusicAndComputers/)
	+ [Malsen and Rockmore](http://www.ams.org/journals/jams/1997-10-01/S0894-0347-97-00219-1/S0894-0347-97-00219-1.pdf)
	  1997 article on computing FT over nonabelian groups.  
    + [Baum and Clausen](http://theory.cs.uni-bonn.de/ftp/reports/cs-reports/1990/8551-CS.pdf)
      1990 report on complexity of FT over nonabelian groups.  
    + Explanation of Some standard methods for ordinary (abelian group) convolution:
	    - [Overlap add method](http://en.wikipedia.org/wiki/Overlap%E2%80%93add_method)
		- [Convolution reverb](https://dvcs.w3.org/hg/audio/raw-file/tip/webaudio/convolution.html)
		- 

3.  **Conferences**  
	+ We gave a preliminary report on GroupSound at
      the MAA Session on the [Intersection of Mathematics and the Arts III][]
      at the [JMM][] on January 16, 2014.  
    + [New Interfaces for Musical Expression (NIME)](http://www.nime.org/nime2014/)  
    + [International Symposium on Musical Acoustics (ISMA)](http://isma.univ-lemans.fr/en/index.html)  
    + [International Computer Music Conference (ICMC)](http://www.computermusic.org/page/23/)  



[Our abstract]: https://github.com/SoundMath/GroupSound/raw/master/Conferences/AMSBaltimore2013/abstract.pdf
[Joint Math Meetings]: http://jointmathematicsmeetings.org/jmm
[JMM]: http://jointmathematicsmeetings.org/jmm
[Intersection of Mathematics and the Arts III]: http://jointmathematicsmeetings.org/meetings/national/jmm2014/2160_program_thursday.html#2160:MCPNORC7

[Matt Corley]: mailto:corleymj@email.sc.edu
[William DeMeo]: mailto:williamdemeo@gmail.com
[Sage worksheet (experiements.sws)]: https://github.com/SoundMath/GroupSound/blob/develop/src/Sage/experiments.sws
[Sage worksheet (GroupDSP.sws)]: https://github.com/SoundMath/GroupSound/blob/master/src/Sage/GroupDSP.sws
[Sage worksheet (wavwrite_examples.sws)]: https://github.com/SoundMath/GroupSound/blob/master/src/Sage/wavwrite_examples.sws
[xMuse Experimental Music Studio]: (http://www.sc.edu/study/colleges_schools/music/study/academic_areas/composition/xmuse_experimental_studio.php)
