function transitTime = totalTime2(engineStats,optimalDist)
% The purpose of "totalTime2" is to be beautiful
% Inputs 
% Outputs 
% Calculations 


%Selection  Lists with constants
shipData = readtable("shipManifest.csv",ReadVariableNames=false) ;

% isp = engineStats{2} ; %sec
mdot = engineStats{3} ; %kg/sec
thrust = engineStats{4} ; %Newtons

massFuelInitial = shipData{1,2} ; %kg Total mass of Fuel
dryMass  = shipData{1,3} ; %kg Mass of ship dry
v0 = 7800 ; %m/s LEO 


burnTimeMax = massFuelInitial/mdot ; %sec
aAvg = (thrust/(massFuelInitial-(mdot*burnTimeMax)+dryMass)+thrust/ ...
    (massFuelInitial+dryMass))/2 ;
burnDist = v0*burnTimeMax+.5*aAvg*burnTimeMax^2 ;

maxBurnDist = optimalDist ;

% while loop standards
parameter = 2.00e+8 ;
counter = 0 ;
if burnDist > maxBurnDist
    
    while parameter > 1.00e+2 
        optimalBurnTime = (sqrt(v0^2+2*aAvg*maxBurnDist)-v0)/aAvg ;
        newBurnDist = (v0*optimalBurnTime)+(.5*aAvg*optimalBurnTime^2) ;
        parameter = abs(maxBurnDist-newBurnDist) ;
        counter = counter+1 ;
        % breaks loop at 50 iterations
        if counter > 50
            break 
        end
    end
    
    burnTime = optimalBurnTime ;
    burnDist = newBurnDist ;
else
    burnTime = burnTimeMax ;
end


vf = v0+aAvg*burnTime ;
coastTime = (optimalDist-(burnDist))/vf ;
transitTime = burnTime+coastTime ; %seconds

transitTime = (transitTime/60)/60 ; %hours

burnTime = burnTime/60 ; 
coastTime = coastTime/60 ; 
coastTime = floor(abs(coastTime)) ;
optimalDist = optimalDist/1000 ; 

fuelBurnt = (mdot*burnTime*60) ;



colNames = ["Total_Time_Hours","Burn_Time_Minutes","Coast_Time_Minutes", ...
    "Total_Distance_km","Initial_Fuel_kg","Fuel_Burnt_kg",] ;
data = table(transitTime,burnTime,coastTime,optimalDist,massFuelInitial,fuelBurnt,VariableNames=colNames) ;
fileID = "flightData.csv" ;
writetable(data,fileID) ;


end
