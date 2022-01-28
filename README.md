# shadow
Shadow is a Matlab toolbox written to detect the GNSS satellite at shadow of the earth and remove them from the RINEX observation file.

The main toolbox performs the following tasks:                          
1- Reads Rinex observation file                                       
2- Reads precise ephemeris file (SP3)                                 
3- Detect the satellite at shadow of the Earth                        
4- Remove theobservation of the satellite and create a refined Rinex

**NOTE:** This part of toolbox which is now open source, determines the GNSS satellites at shadow of the Earth. The rest of toolbox will be released in the future.

**For more information read the following paper:**                        
   - Allahverdi-Zadeh, A., Asgari, J. and Amiri-Simkooei, A.R., 2016. "Investigation of GPS draconitic year effect on GPS time series of eliminated eclipsing GPS satellite data". Journal of Geodetic Science, 6(1). https://doi.org/10.1515/jogs-2016-0007               
                                                                         
 The fundamentals of the shadow detection models provide in this toolbox are used in the following studies:                                      
   - Allahvirdi-Zadeh, A., "Evaluation of the GPS Observable Effects Located in the Earth Shadow on Permanent Station Position Time Series", (2013), MSc thesis, Isfahan University, https://doi.org/10.13140/RG.2.2.28151.32167                         
                                                                         
   - Wang,K., Allahvirdi-Zadeh, A., El-Mowafy, A. and Gross, J.N., 2020. "A sensitivity study of POD using dual-frequency GPS for CubeSats data limitation and resources". Remote Sensing, 12(13), p.2107. https://doi.org/10.3390/rs12132107                                  
                                                                         
   - Allahvirdi-Zadeh, A., Wang, K. and El-Mowafy, A., 2021. "POD of small LEO satellites based on precise real-time MADOCA and SBAS-aided PPP corrections". GPS Solutions, 25(2), pp.1-14. https://doi.org/10.1007/s10291-020-01078-8                          
                                                                         
   - Allahvirdizadeh, A. and El-Mowafy, A., 2021. "Precise Orbit Determination of CubeSats Using a Proposed Observations Weighting Model". In Scientific Assembly of the International Association of Geodesy (pp. 1-3). https://doi.org/10.13140/RG.2.2.20619.62244/1    
                                                                         
   - Allahvirdi-Zadeh, A., Wang, K. and El-Mowafy, A., 2022. "Precise Orbit Determination of LEO Satellites Based on Undifferenced GNSS Observations". Journal of surveying engineering, 148(1). https://doi.org/10.1061/(ASCE)SU.1943-5428.0000382          
                                                                         
                                                                         
   - Allahvirdizadeh, A., 2021. "Phase centre variation of the GNSS antenna onboard the CubeSats and its impact on precise orbit        
     determination". In GSA Earth Sciences Students Symposium-WA (GESSS-WA). http://dx.doi.org/10.13140/RG.2.2.10355.45607/1
                                                                         
   - Allahvirdi-Zadeh, A., Awange, J., El-Mowafy, A., Ding, T. and Wang, K., 2022. "Stability of CubeSat Clocks and Their Impacts on GNSS Radio Occultation." Remote Sensing, 14(2), p.362. https://doi.org/10.3390/rs14020362                                  
                                                                         
                                                                         
**How to cite this toolbox?**                                             
   - Allahvirdi-Zadeh, "Shadow Toolbox": Detecting GNSS satellites in the shadow of the Earth and removing from their observations from the RINEX file, https://doi.org/10.13140/RG.2.2.15323.08482  
   - Allahvirdi-Zadeh, Amir (2022): Shadow toolbox. figshare. Software. https://doi.org/10.6084/m9.figshare.19085546.v1  

**How to use?**

Run main.m and select the your sp3 file (a sample of sp3 file is provided: igs21385.sp3).

-------------------------------------------------------------------------
                                                                         
  Author: **Amir Allahvirdi-Zadeh**                                          
  Email : amir.allahvirdizadeh@curtin.edu.au                                                     
