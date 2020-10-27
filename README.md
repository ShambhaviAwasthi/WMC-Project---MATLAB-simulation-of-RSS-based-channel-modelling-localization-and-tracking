# WMC-Project---MATLAB-simulation-of-RSS-based-channel-modelling-localization-and-tracking
This is the project for course Wireless Mobile Communication.

Wireless communication has evolved significantly, over the past several decades, to meet the ever-growing demand for high data rates over the wireless medium. Systems have been designed for indoor applications and outdoor applications where mobility is a very important aspect of system specification. The propagation model for the wireless channel is characterized by path loss, multipath fading and Doppler spread (or Doppler spectrum). All these characteristics are affected by the physical environment between the transmitter and receiver as well as system dependent parameters such as antenna heights, antenna beam-widths, antenna polarization, and mutual coupling between multiple antennas.This project presents a MATLAB simulation of RSS based channel modelling , localization and tracking. Many factors have to be considered when RSS-based localization applications are designed, starting from selection of the proper propagation model, which has to represent in a relatively accurate way the interaction between the RF signal and the environment. It is demonstrated that the RSS can be used for outdoor localization.

Working of the code :
1. Estimation functions are initialised for LLS and WLS in main_loop. Similarly mobility patterns i.e random , straight line and square are also initialised and mapped to respective parameters inputs as follows:
For random input nb_locations = 200
For straight line input nb_locations = 100
For square no input is required.
2. Now we input base station coordinates as ( known coordinates or anchor nodes ) - (0,0) , (0,1000) , (1000,1000) , (1000,0).
3. Next we initialise noise parameters for the channel as mean = 0 and deviation = 1 following Gaussian Distribution and for generating white noise.
4. Also path loss exponent is 3 dB, reference power at refernce distance of 1m is -10 for the calculation of RSS using lognormal path loss model.
5. Using the main_loop.m we now find the localization error for all mobility patterns using both LLS and WLS and the result is stored in errors cells. This localization error is found using test_function.m .
6. Test_function takes inputs for estimation functions, mobility patterns, noise parameters stated above and parameters for path loss model to estimate RSS.
7. In test_function, we define x coordinates of the 4 anchors and y coordinates of all 4 anchors.
Anchor_x=[0 0 1000 1000]
Anchor_y=[0 1000 1000 0]
We find [x y s] for all mobility patterns and store them column wise as
[ x,y,s for random ; x,y,s for linear ; x,y,s for square]
Number of mobile node positions = number of x-coordinates
Number of base station or anchor nodes = 4
Number of estimated coordinate = number of positions of the mobile node
8. Now for all the mobile node positions generated through mobility patterns we find error as follows:
9. Compute distance between 4 anchor nodes and source node using compute_dist.m which takes input for (a_x,a_y) coordinates of anchors and (s_x,s_y) coordinates of source ( generated through mobility pattern ). This function computes distance using eucl_dist.m thus using 2D distance formula to find distance between both points.
10. Next, we compute RSS for each source node using compute_rss.m which takes above calculated distance, noise array generated from set_noise.m, alpha, reference power and refernce distance for path loss model as input. Compute_rss.m computes the received signal strength using Log normal path loss model formula for all 4 anchor nodes.
11. Now, we find the estimated distance. Here estimate_dist.m is used which takes above calculated RSS, noise array, alpha, reference power and refernce distance for path loss model as input. It returns estimated distances.
12. Last is to find the estimated coordinates using LLS and WLS. Through computation on lls.m and wls.m , we get the estimated coordinates for all source node positions. In lls.m we generate B and H matrix using above algorithm equations. Similarly for wls.m .
13. Concatenating the originally generated mobile source coordinates through mobility patterns we get the actual coordinates.
14. Hence we compute error between actual and estimated coordinates using compute_error.m function. Error is computed as euclidean distance between actual and estimated coordinates.
15. This error for all mobility patterns and LLS and WLS estimation is returned as a result of test_function.m .
16. Now we plot this error for all mobility patters as well as for both estimation functions.
17. First plot is for two estimation functions and hence contains 2 subplots. 
18. Second plot is for various mobility patterns and hence contains 3 subplots.

