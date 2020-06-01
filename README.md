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
