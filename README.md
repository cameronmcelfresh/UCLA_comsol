# How-to : COMSOL for Crystal Plasticity on hoffman2


0. Make sure XQuartz is installed locally (Mac OS). You may need to restart your computer prior to full installation. More information can be found here - https://www.hoffman2.idre.ucla.edu/access/x11_forwarding/. If using a different OS, follow the similar instructions at the previous link to enable local GUI operation. 

1. ssh into hoffman2 terminal and enable X11 forwarding for GUI appications with the -Y command. 
```cpp
ssh -Y login_id@hoffman2.idre.ucla.edu
```

2. Request an interactive session. An example of a 4-hour interactive session can be found below. More information can be found here: https://www.hoffman2.idre.ucla.edu/computing/interactive-session/. 
```cpp
qrsh -l h_rt=4:00:00,h_data=12G
```
For access to COMSOL 5.5 if you have high-performance nodes, use
```cpp
qrsh -l rh7,h_data=20G
```

3. Load COMSOL into the workspace 
```cpp
module load comsol
```
4. Run COMSOL
```cpp
comsol
```
If this GUI crashes, try
```cpp
comsol -3Drend sw
```
Or 
```cpp
comsol &
```
5. Given a minute or two, the COMSOL GUI should open. From here, you can use File -> Load File -> select the poly_cp.mph file. The simulation parameters can be altered by selecting the desired varaible tab. Once all desired parameters have been updated, you can hit "compute" to start the simulation. 

6. Alternatively to running COMSOL during an interactive session, the job .mph file can be submitted through hoffman2. To run in a multi-thread capacity use:
```cpp
comsol.q.multithread
```
Alternatively, to run in parallel use
```cpp
comsol.q.parallel
```
In both cases, follow to menu to build the command file (as you would with the job.q menu), and submit the job. The hoffman2 description for job submission can be found here - https://www.hoffman2.idre.ucla.edu/comsol/. 

## How-to : Basic Post-Processing of COMSOL Data
Onec the .mph file competed evaluation through the COMSOL software, several different avenues can be taken to analyze the initial microstructure and resulting structural propoerty evolution. 


Firstly, the grain structure of the initial cube can be observed. This step could actually take place prior to running the .mph file, so long as the grain orientations have been pre-loaded into COMSOL. Follow the steps of:

1. Click on Interpolation 1/2/3, under global definitions
2. "Create Plot" (makes a new "3D plot group")
3. Click on "Volume", which appears to be a filled in 3D cube in the toolbar
4. Under Dataset, seelct "From Parent"
5. For expressions, use the drop down selection menu to select Global Def->Functions-> qi1
6. Finally, click "plot". Then delete the plane data one tab above for easier viewing. The structure should appeear as something similar to the image shown below:

<img src="https://github.com/cameronmcelfresh/images/blob/master/grain_orientation_comsol.png" width="700">

Next, it may be of interest to observe many of the spatially distributed variables that were derived from the COMSOL simulation. If dislocation density were of interst, for example, follow the steps below. The same procedure would be possible for any other spatially distributed variable or derived value. 


1. Click on the "Derived Values" tab
2. Click on "Volume", which appears to be a filled in 3D cube in the toolbar
3. Select the specific point in time from the "Time" dropdown menu that you are interested in plotting
4. Click on the "Volume 1" tab which appears below the newly created 3D plot group
5. Under "Dataset" select "From Parent"
6. Under the expressions tab, use the drop down red and green arrows to select the variable of interest. For derived values follow the path of Component 1 -> Definitions -> Variables -> (Dislocation Density)
7. Finally, click plot and the 3D volume should populate with an image similar to the one below. 

<img src="https://github.com/cameronmcelfresh/images/blob/master/dislocation_density_comsol.png" width="700">

Note: process meant to link with code found here: https://github.com/admal002/Diffuse-interface-polycrystal-plasticity
