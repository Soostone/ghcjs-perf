# GHCJS Performance Problems

This repo demonstrates significant GHCJS build performance problems with
TemplateHaskell.  There are four modules which differ in very small ways but
have very different build times.  Here are the results:

    $ time ghcjs --make src/ThPerf1.hs                                                                                                                                                                                                                                                           
    [1 of 1] Compiling ThPerf1          ( src/ThPerf1.hs, src/ThPerf1.js_o )
    
    real    0m0.960s
    user    0m0.889s
    sys     0m0.069s
    
    $ time ghcjs --make src/ThPerf2.hs                                                                                                                                                                                                                                                           
    [1 of 1] Compiling ThPerf2          ( src/ThPerf2.hs, src/ThPerf2.js_o )
    Linking Template Haskell (ThRunner1)
    
    real    0m3.959s
    user    0m4.053s
    sys     0m0.725s
    
    $ time ghcjs --make src/ThPerf3.hs                                                                                                                                                                                                                                                           
    [1 of 1] Compiling ThPerf3          ( src/ThPerf3.hs, src/ThPerf3.js_o )
    Linking Template Haskell (ThRunner1)
    
    real    0m29.897s
    user    0m26.309s
    sys     0m5.313s
    
    $ time ghcjs --make src/ThPerf4.hs                                                                                                                                                                                                                                                           
    [1 of 1] Compiling ThPerf4          ( src/ThPerf4.hs, src/ThPerf4.js_o )
    Linking Template Haskell (ThRunner1)
    
    real    0m6.109s
    user    0m6.332s
    sys     0m0.982s
    
    $ time ghcjs --make -isrc ThPerf5 -fforce-recomp
    [1 of 2] Compiling ThPerf5.QQ       ( src/ThPerf5/QQ.hs, src/ThPerf5/QQ.js_o )
    [2 of 2] Compiling ThPerf5          ( src/ThPerf5.hs, src/ThPerf5.js_o )
    Linking Template Haskell (ThPerf5.QQ,ThRunner1)
    
    real    0m19.323s
    user    0m16.981s
    sys     0m3.780s

Note that on the ThPerf5 build the time it took to build the ThPerf5.QQ module
was minimal (I estimate 1 or 2 seconds) compared to the total time.
