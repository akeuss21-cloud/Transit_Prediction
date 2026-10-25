
function totalMass = shipMass2(engineStats)
% The purpose is to calculate and store the variables of the simulated ship
% in a csv file
% The only function input is a engine type which is an numerical index.
% other inputs are type of construction and depending on the if then
% function there will be prompts for numerical inputs for a custom mass,
% and fuel amounts.
% The outputs include the total mass and a csv file including total dry
% mass (without fuel), total mass, fuel mass, and the engine type. 
% the type of calculations are simple addition and subtraction of pre set
% or inputed weights




constType = menu("Type of Spacecraft","ISS","Custom Mass") ;
if constType == 3
    standModCount = menu('number of storage modules','1','2','3','4');
    sciModCount = menu('number of science modules','1','2','3','4');
    
    %Using Leonardo Multipurpose Logistics Module (PMM) as basic stats for
    %modules 
    
    tankWeight = 50000 ; % half the mass of the dry sls fuel tank kg
    pmmWeight = 4437.94 ; %kg 
    tranWeight = 17991.74 ; %kg
    %engineWeight = 29000 ; %Artemis 2 ICPS as placeholder
    % add different fuel tank sizes 
    dryMass = (standModCount*pmmWeight + sciModCount*tranWeight + ...
        engineStats{1} + tankWeight)/1000; % in metric tons
elseif constType == 1 
    
    dryMass = 415725+engineStats{1} ; %Mass of the ISS kg
elseif constType == 2
    customMass = input("Custom Mass in kg: ") ;
    overrideEngine = menu("Override Engine Weight","Yes","No") ;
    if overrideEngine == 1 
        newEngineMass = input("Input New Engine Weight: ") ;
        dryMass = customMass+newEngineMass ;
    else 
        dryMass = customMass+engineStats{1} ;

    end
end
fuelMass = input("Input amount of fuel in kg between 10000-7000000: ") ;
while fuelMass>7500000 | fuelMass<10000 
    if fuelMass>7500000 | fuelMass<10000
        fuelMass = input("Input new amount of fuel in kg between 10000-7000000: ") ;
    else 
        break
    end
end

totalMass = dryMass+fuelMass ;

colNames = ["Total Mass","Fuel Mass","Dry Mass","Engine Mass"] ;
mainTable = table(totalMass,fuelMass,dryMass,engineStats{1},VariableNames=colNames) ;



fileID = "shipManifest.csv" ;

writetable(mainTable,fileID) ;


end
