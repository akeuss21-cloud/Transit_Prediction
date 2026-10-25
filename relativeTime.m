function realTime = relativeTime(engineStats,optimalDist,maxAccel)




end

optimalDist = 1.1258e17 ; %meters
c = 2.99792458e8 ; %m/s
maxAccel = 0.8409 ; %m/s/s

realTime = (c/maxAccel)*sqrt(((optimalDist*maxAccel)/c^2)^2-1) ; % seconds
realTime = realTime/60/60/24/365 ; % years
realTime







