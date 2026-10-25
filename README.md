# READ ME

## Lunar Transit Prediction
### Synopsis
This code is built to allow the user to predict the time of transit from the earth to the moon using a Brachistochrone Trajectory and parameters given about the spacecraft and its propulsion systems. Brachistochrone Trajectories require burning the engines at both the start and end of the journey and throughout the entire trip in order to constantly accelerate and limit transit time.
### Author
Alex Keuss

#### Created 2026-04-30

#### Last Updated 2026-05-06

### Installation and Use
To install open the mainscript inside the main directory titled  "mainLunarTranScript.mlx" in Matlab 2025b. Then run the script and enter inputs as prompted. The code must be run atleast once before a previous design can be used or an error message "No Previous File" will occur. In order to prevent output files from each code itereration from being overwritten save them to a seperate folder under a new file name to prevent the data from being overwritten when the code is run again.
#### Example
Inputs given in order.
1. Engine Type: (Custom Engine)
2. Enter Specific Impulse(ISP): 500
3. Enter Mass Flow Rate(mdot): 400
4. Enter Dry Mass of the Engine in kg: 3000
5. Would you like to use a previous design?: (No)
6. Type of Spacecraft: (ISS)
7. Input Amount of fuel in kg (ex. between 10000-7000000): 6000000 
8. Would you like to change fuel mass?: (No)
9. Would you like a consolidated report?: (Yes)
##### Outputs
The Thrust for the Custom Engine is 1960000.000 Newtons 
The Specific Impulse for the Custom Engine is 500.000 Seconds 
The Mass Flow Rate for the Custom Engine is 400.000 Kilograms per Second 
- The Final Report is stored as a text file titled "FinalReport.txt"
= ===============
 Engine Specifications 
= =============== 
The Thrust for the Custom Engine is 1960000.000 Newtons 
The Specific Impulse for the Custom Engine is 500.000 Seconds 
The Mass Flow Rate for the Custom Engine is 400.000 Kilograms per Second 
= ===============
 Ship Specifications 
= =============== 
The Total Mass for the ship is 6415727 Kilograms 
The Fuel Mass for the ship is 6000000 Kilograms 
The Dry Mass for the ship is 415727 Kilograms 
The Engine Mass for the ship is   2 Kilograms 
= ===============
 Lunar Transit Prediction 
= =============== 
The total transit time is 4.07 hours 
The burn time is 244.46 minutes 
The coast time is 0.00 minutes 
The total distance traveled is 384400.00 kilometers 


### Change Log
<span style="color: red;font-weight:700;font-size:20px"></spanThe>[Unreleased]</span>
Last update 2026-05-06
Change Log (CHANGELOG.MD) file listed under the main directory 
