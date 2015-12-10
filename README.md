# GHCJS Performance Problems

This repo demonstrates significant GHCJS build performance problems with
TemplateHaskell.  There are four modules which differ in very small ways but
have very different build times.  Here are the results:

    $ time ghcjs --make src/ThPerf1.hs
    [1 of 1] Compiling ThPerf1          ( src/ThPerf1.hs, src/ThPerf1.js_o )

    real    0m0.961s
    user    0m0.885s
    sys     0m0.073s

    $ time ghcjs --make src/ThPerf2.hs
    [1 of 1] Compiling ThPerf2          ( src/ThPerf2.hs, src/ThPerf2.js_o )
    Linking Template Haskell (ThRunner1)

    real    0m4.058s
    user    0m4.148s
    sys     0m0.730s

    $ time ghcjs --make src/ThPerf3.hs
    [1 of 1] Compiling ThPerf3          ( src/ThPerf3.hs, src/ThPerf3.js_o )
    Linking Template Haskell (ThRunner1)

    real    0m29.852s
    user    0m26.385s
    sys     0m5.246s

    $ time ghcjs --make src/ThPerf4.hs                                                                                                                                                                                                                                                
    [1 of 1] Compiling ThPerf4          ( src/ThPerf4.hs, src/ThPerf4.js_o )
    Linking Template Haskell (ThRunner1)
    
    real    0m6.356s
    user    0m6.496s
    sys     0m1.037s

    $ time ghcjs --make -isrc ThPerf5 -fforce-recomp

    [1 of 2] Compiling ThPerf5.QQ       ( src/ThPerf5/QQ.hs, src/ThPerf5/QQ.js_o )
    [2 of 2] Compiling ThPerf5          ( src/ThPerf5.hs, src/ThPerf5.js_o )
    Linking Template Haskell (ThPerf5.QQ,ThRunner1)

    real	0m8.635s
    user	0m7.639s
    sys	0m1.663s
