% PATTERN INTERPOLATION (ex3c)
% 
% Interpolated half-wave Dipole pattern used to construct a 4-element array 
% Freq = 300 MHz
%
% Source files are :  dipole.nec   The NEC2 model used to generate data
%                     dipole.out   Data for interpolation 
%
% Nec data has been calculated in 10deg steps in theta and phi.
% Demonstrates the use of the 'interp' element type.
%
% In this version the NEC data reading command, loadnecpat1 
% has been commented out and the raw data pasted in directly.
% See inside this file for details...

close all
clear all
clc

help ex3c

init;                                           % Initialise global variables

%loadnecpat1('dipole');                         % Loads raw NEC output data, processes it and saves file called 
                                                % 'pattern1.mat' that contains variable pattern_config
%load pattern1;                                 % Load the .mat file, pattern_config is now available 
                                                % in the MATLAB environment (see help for loadnecpat1 and interp)


% The altenative method is to 'cut and paste' data, the
% data below is the NEC2 dipole data pasted directly in
% to pattern_config. Replace with your own data as required.


%     Theta(Deg)     Phi(Deg)     Total Power (dB)

pattern_config=[...
  0.0000000e+000  0.0000000e+000  2.1200000e+000
  1.0000000e+001  0.0000000e+000  1.9300000e+000
  2.0000000e+001  0.0000000e+000  1.3500000e+000
  3.0000000e+001  0.0000000e+000  3.8000000e-001
  4.0000000e+001  0.0000000e+000 -1.0200000e+000
  5.0000000e+001  0.0000000e+000 -2.8900000e+000
  6.0000000e+001  0.0000000e+000 -5.4100000e+000
  7.0000000e+001  0.0000000e+000 -8.9800000e+000
  8.0000000e+001  0.0000000e+000 -1.5050000e+001
  9.0000000e+001  0.0000000e+000 -9.9999000e+002
  1.0000000e+002  0.0000000e+000 -1.5050000e+001
  1.1000000e+002  0.0000000e+000 -8.9800000e+000
  1.2000000e+002  0.0000000e+000 -5.4100000e+000
  1.3000000e+002  0.0000000e+000 -2.8900000e+000
  1.4000000e+002  0.0000000e+000 -1.0200000e+000
  1.5000000e+002  0.0000000e+000  3.8000000e-001
  1.6000000e+002  0.0000000e+000  1.3500000e+000
  1.7000000e+002  0.0000000e+000  1.9300000e+000
  1.8000000e+002  0.0000000e+000  2.1200000e+000
  0.0000000e+000  1.0000000e+001  2.1200000e+000
  1.0000000e+001  1.0000000e+001  1.9300000e+000
  2.0000000e+001  1.0000000e+001  1.3700000e+000
  3.0000000e+001  1.0000000e+001  4.3000000e-001
  4.0000000e+001  1.0000000e+001 -9.0000000e-001
  5.0000000e+001  1.0000000e+001 -2.6700000e+000
  6.0000000e+001  1.0000000e+001 -4.9800000e+000
  7.0000000e+001  1.0000000e+001 -8.0300000e+000
  8.0000000e+001  1.0000000e+001 -1.2040000e+001
  9.0000000e+001  1.0000000e+001 -1.5050000e+001
  1.0000000e+002  1.0000000e+001 -1.2040000e+001
  1.1000000e+002  1.0000000e+001 -8.0300000e+000
  1.2000000e+002  1.0000000e+001 -4.9800000e+000
  1.3000000e+002  1.0000000e+001 -2.6700000e+000
  1.4000000e+002  1.0000000e+001 -9.0000000e-001
  1.5000000e+002  1.0000000e+001  4.3000000e-001
  1.6000000e+002  1.0000000e+001  1.3700000e+000
  1.7000000e+002  1.0000000e+001  1.9300000e+000
  1.8000000e+002  1.0000000e+001  2.1200000e+000
  0.0000000e+000  2.0000000e+001  2.1200000e+000
  1.0000000e+001  2.0000000e+001  1.9500000e+000
  2.0000000e+001  2.0000000e+001  1.4400000e+000
  3.0000000e+001  2.0000000e+001  6.0000000e-001
  4.0000000e+001  2.0000000e+001 -5.8000000e-001
  5.0000000e+001  2.0000000e+001 -2.0800000e+000
  6.0000000e+001  2.0000000e+001 -3.9200000e+000
  7.0000000e+001  2.0000000e+001 -6.0200000e+000
  8.0000000e+001  2.0000000e+001 -8.0300000e+000
  9.0000000e+001  2.0000000e+001 -8.9800000e+000
  1.0000000e+002  2.0000000e+001 -8.0300000e+000
  1.1000000e+002  2.0000000e+001 -6.0200000e+000
  1.2000000e+002  2.0000000e+001 -3.9200000e+000
  1.3000000e+002  2.0000000e+001 -2.0800000e+000
  1.4000000e+002  2.0000000e+001 -5.8000000e-001
  1.5000000e+002  2.0000000e+001  6.0000000e-001
  1.6000000e+002  2.0000000e+001  1.4400000e+000
  1.7000000e+002  2.0000000e+001  1.9500000e+000
  1.8000000e+002  2.0000000e+001  2.1200000e+000
  0.0000000e+000  3.0000000e+001  2.1200000e+000
  1.0000000e+001  3.0000000e+001  1.9800000e+000
  2.0000000e+001  3.0000000e+001  1.5500000e+000
  3.0000000e+001  3.0000000e+001  8.5000000e-001
  4.0000000e+001  3.0000000e+001 -1.0000000e-001
  5.0000000e+001  3.0000000e+001 -1.2700000e+000
  6.0000000e+001  3.0000000e+001 -2.5900000e+000
  7.0000000e+001  3.0000000e+001 -3.9200000e+000
  8.0000000e+001  3.0000000e+001 -4.9800000e+000
  9.0000000e+001  3.0000000e+001 -5.4100000e+000
  1.0000000e+002  3.0000000e+001 -4.9800000e+000
  1.1000000e+002  3.0000000e+001 -3.9200000e+000
  1.2000000e+002  3.0000000e+001 -2.5900000e+000
  1.3000000e+002  3.0000000e+001 -1.2700000e+000
  1.4000000e+002  3.0000000e+001 -1.0000000e-001
  1.5000000e+002  3.0000000e+001  8.5000000e-001
  1.6000000e+002  3.0000000e+001  1.5500000e+000
  1.7000000e+002  3.0000000e+001  1.9800000e+000
  1.8000000e+002  3.0000000e+001  2.1200000e+000
  0.0000000e+000  4.0000000e+001  2.1200000e+000
  1.0000000e+001  4.0000000e+001  2.0100000e+000
  2.0000000e+001  4.0000000e+001  1.6800000e+000
  3.0000000e+001  4.0000000e+001  1.1400000e+000
  4.0000000e+001  4.0000000e+001  4.3000000e-001
  5.0000000e+001  4.0000000e+001 -4.0000000e-001
  6.0000000e+001  4.0000000e+001 -1.2700000e+000
  7.0000000e+001  4.0000000e+001 -2.0800000e+000
  8.0000000e+001  4.0000000e+001 -2.6700000e+000
  9.0000000e+001  4.0000000e+001 -2.8900000e+000
  1.0000000e+002  4.0000000e+001 -2.6700000e+000
  1.1000000e+002  4.0000000e+001 -2.0800000e+000
  1.2000000e+002  4.0000000e+001 -1.2700000e+000
  1.3000000e+002  4.0000000e+001 -4.0000000e-001
  1.4000000e+002  4.0000000e+001  4.3000000e-001
  1.5000000e+002  4.0000000e+001  1.1400000e+000
  1.6000000e+002  4.0000000e+001  1.6800000e+000
  1.7000000e+002  4.0000000e+001  2.0100000e+000
  1.8000000e+002  4.0000000e+001  2.1200000e+000
  0.0000000e+000  5.0000000e+001  2.1200000e+000
  1.0000000e+001  5.0000000e+001  2.0400000e+000
  2.0000000e+001  5.0000000e+001  1.8100000e+000
  3.0000000e+001  5.0000000e+001  1.4400000e+000
  4.0000000e+001  5.0000000e+001  9.7000000e-001
  5.0000000e+001  5.0000000e+001  4.3000000e-001
  6.0000000e+001  5.0000000e+001 -1.0000000e-001
  7.0000000e+001  5.0000000e+001 -5.8000000e-001
  8.0000000e+001  5.0000000e+001 -9.0000000e-001
  9.0000000e+001  5.0000000e+001 -1.0200000e+000
  1.0000000e+002  5.0000000e+001 -9.0000000e-001
  1.1000000e+002  5.0000000e+001 -5.8000000e-001
  1.2000000e+002  5.0000000e+001 -1.0000000e-001
  1.3000000e+002  5.0000000e+001  4.3000000e-001
  1.4000000e+002  5.0000000e+001  9.7000000e-001
  1.5000000e+002  5.0000000e+001  1.4400000e+000
  1.6000000e+002  5.0000000e+001  1.8100000e+000
  1.7000000e+002  5.0000000e+001  2.0400000e+000
  1.8000000e+002  5.0000000e+001  2.1200000e+000
  0.0000000e+000  6.0000000e+001  2.1200000e+000
  1.0000000e+001  6.0000000e+001  2.0700000e+000
  2.0000000e+001  6.0000000e+001  1.9300000e+000
  3.0000000e+001  6.0000000e+001  1.7200000e+000
  4.0000000e+001  6.0000000e+001  1.4400000e+000
  5.0000000e+001  6.0000000e+001  1.1400000e+000
  6.0000000e+001  6.0000000e+001  8.5000000e-001
  7.0000000e+001  6.0000000e+001  6.0000000e-001
  8.0000000e+001  6.0000000e+001  4.3000000e-001
  9.0000000e+001  6.0000000e+001  3.8000000e-001
  1.0000000e+002  6.0000000e+001  4.3000000e-001
  1.1000000e+002  6.0000000e+001  6.0000000e-001
  1.2000000e+002  6.0000000e+001  8.5000000e-001
  1.3000000e+002  6.0000000e+001  1.1400000e+000
  1.4000000e+002  6.0000000e+001  1.4400000e+000
  1.5000000e+002  6.0000000e+001  1.7200000e+000
  1.6000000e+002  6.0000000e+001  1.9300000e+000
  1.7000000e+002  6.0000000e+001  2.0700000e+000
  1.8000000e+002  6.0000000e+001  2.1200000e+000
  0.0000000e+000  7.0000000e+001  2.1200000e+000
  1.0000000e+001  7.0000000e+001  2.1000000e+000
  2.0000000e+001  7.0000000e+001  2.0300000e+000
  3.0000000e+001  7.0000000e+001  1.9300000e+000
  4.0000000e+001  7.0000000e+001  1.8100000e+000
  5.0000000e+001  7.0000000e+001  1.6800000e+000
  6.0000000e+001  7.0000000e+001  1.5500000e+000
  7.0000000e+001  7.0000000e+001  1.4400000e+000
  8.0000000e+001  7.0000000e+001  1.3700000e+000
  9.0000000e+001  7.0000000e+001  1.3500000e+000
  1.0000000e+002  7.0000000e+001  1.3700000e+000
  1.1000000e+002  7.0000000e+001  1.4400000e+000
  1.2000000e+002  7.0000000e+001  1.5500000e+000
  1.3000000e+002  7.0000000e+001  1.6800000e+000
  1.4000000e+002  7.0000000e+001  1.8100000e+000
  1.5000000e+002  7.0000000e+001  1.9300000e+000
  1.6000000e+002  7.0000000e+001  2.0300000e+000
  1.7000000e+002  7.0000000e+001  2.1000000e+000
  1.8000000e+002  7.0000000e+001  2.1200000e+000
  0.0000000e+000  8.0000000e+001  2.1200000e+000
  1.0000000e+001  8.0000000e+001  2.1100000e+000
  2.0000000e+001  8.0000000e+001  2.1000000e+000
  3.0000000e+001  8.0000000e+001  2.0700000e+000
  4.0000000e+001  8.0000000e+001  2.0400000e+000
  5.0000000e+001  8.0000000e+001  2.0100000e+000
  6.0000000e+001  8.0000000e+001  1.9800000e+000
  7.0000000e+001  8.0000000e+001  1.9500000e+000
  8.0000000e+001  8.0000000e+001  1.9300000e+000
  9.0000000e+001  8.0000000e+001  1.9300000e+000
  1.0000000e+002  8.0000000e+001  1.9300000e+000
  1.1000000e+002  8.0000000e+001  1.9500000e+000
  1.2000000e+002  8.0000000e+001  1.9800000e+000
  1.3000000e+002  8.0000000e+001  2.0100000e+000
  1.4000000e+002  8.0000000e+001  2.0400000e+000
  1.5000000e+002  8.0000000e+001  2.0700000e+000
  1.6000000e+002  8.0000000e+001  2.1000000e+000
  1.7000000e+002  8.0000000e+001  2.1100000e+000
  1.8000000e+002  8.0000000e+001  2.1200000e+000
  0.0000000e+000  9.0000000e+001  2.1200000e+000
  1.0000000e+001  9.0000000e+001  2.1200000e+000
  2.0000000e+001  9.0000000e+001  2.1200000e+000
  3.0000000e+001  9.0000000e+001  2.1200000e+000
  4.0000000e+001  9.0000000e+001  2.1200000e+000
  5.0000000e+001  9.0000000e+001  2.1200000e+000
  6.0000000e+001  9.0000000e+001  2.1200000e+000
  7.0000000e+001  9.0000000e+001  2.1200000e+000
  8.0000000e+001  9.0000000e+001  2.1200000e+000
  9.0000000e+001  9.0000000e+001  2.1200000e+000
  1.0000000e+002  9.0000000e+001  2.1200000e+000
  1.1000000e+002  9.0000000e+001  2.1200000e+000
  1.2000000e+002  9.0000000e+001  2.1200000e+000
  1.3000000e+002  9.0000000e+001  2.1200000e+000
  1.4000000e+002  9.0000000e+001  2.1200000e+000
  1.5000000e+002  9.0000000e+001  2.1200000e+000
  1.6000000e+002  9.0000000e+001  2.1200000e+000
  1.7000000e+002  9.0000000e+001  2.1200000e+000
  1.8000000e+002  9.0000000e+001  2.1200000e+000
  0.0000000e+000  1.0000000e+002  2.1200000e+000
  1.0000000e+001  1.0000000e+002  2.1100000e+000
  2.0000000e+001  1.0000000e+002  2.1000000e+000
  3.0000000e+001  1.0000000e+002  2.0700000e+000
  4.0000000e+001  1.0000000e+002  2.0400000e+000
  5.0000000e+001  1.0000000e+002  2.0100000e+000
  6.0000000e+001  1.0000000e+002  1.9800000e+000
  7.0000000e+001  1.0000000e+002  1.9500000e+000
  8.0000000e+001  1.0000000e+002  1.9300000e+000
  9.0000000e+001  1.0000000e+002  1.9300000e+000
  1.0000000e+002  1.0000000e+002  1.9300000e+000
  1.1000000e+002  1.0000000e+002  1.9500000e+000
  1.2000000e+002  1.0000000e+002  1.9800000e+000
  1.3000000e+002  1.0000000e+002  2.0100000e+000
  1.4000000e+002  1.0000000e+002  2.0400000e+000
  1.5000000e+002  1.0000000e+002  2.0700000e+000
  1.6000000e+002  1.0000000e+002  2.1000000e+000
  1.7000000e+002  1.0000000e+002  2.1100000e+000
  1.8000000e+002  1.0000000e+002  2.1200000e+000
  0.0000000e+000  1.1000000e+002  2.1200000e+000
  1.0000000e+001  1.1000000e+002  2.1000000e+000
  2.0000000e+001  1.1000000e+002  2.0300000e+000
  3.0000000e+001  1.1000000e+002  1.9300000e+000
  4.0000000e+001  1.1000000e+002  1.8100000e+000
  5.0000000e+001  1.1000000e+002  1.6800000e+000
  6.0000000e+001  1.1000000e+002  1.5500000e+000
  7.0000000e+001  1.1000000e+002  1.4400000e+000
  8.0000000e+001  1.1000000e+002  1.3700000e+000
  9.0000000e+001  1.1000000e+002  1.3500000e+000
  1.0000000e+002  1.1000000e+002  1.3700000e+000
  1.1000000e+002  1.1000000e+002  1.4400000e+000
  1.2000000e+002  1.1000000e+002  1.5500000e+000
  1.3000000e+002  1.1000000e+002  1.6800000e+000
  1.4000000e+002  1.1000000e+002  1.8100000e+000
  1.5000000e+002  1.1000000e+002  1.9300000e+000
  1.6000000e+002  1.1000000e+002  2.0300000e+000
  1.7000000e+002  1.1000000e+002  2.1000000e+000
  1.8000000e+002  1.1000000e+002  2.1200000e+000
  0.0000000e+000  1.2000000e+002  2.1200000e+000
  1.0000000e+001  1.2000000e+002  2.0700000e+000
  2.0000000e+001  1.2000000e+002  1.9300000e+000
  3.0000000e+001  1.2000000e+002  1.7200000e+000
  4.0000000e+001  1.2000000e+002  1.4400000e+000
  5.0000000e+001  1.2000000e+002  1.1400000e+000
  6.0000000e+001  1.2000000e+002  8.5000000e-001
  7.0000000e+001  1.2000000e+002  6.0000000e-001
  8.0000000e+001  1.2000000e+002  4.3000000e-001
  9.0000000e+001  1.2000000e+002  3.8000000e-001
  1.0000000e+002  1.2000000e+002  4.3000000e-001
  1.1000000e+002  1.2000000e+002  6.0000000e-001
  1.2000000e+002  1.2000000e+002  8.5000000e-001
  1.3000000e+002  1.2000000e+002  1.1400000e+000
  1.4000000e+002  1.2000000e+002  1.4400000e+000
  1.5000000e+002  1.2000000e+002  1.7200000e+000
  1.6000000e+002  1.2000000e+002  1.9300000e+000
  1.7000000e+002  1.2000000e+002  2.0700000e+000
  1.8000000e+002  1.2000000e+002  2.1200000e+000
  0.0000000e+000  1.3000000e+002  2.1200000e+000
  1.0000000e+001  1.3000000e+002  2.0400000e+000
  2.0000000e+001  1.3000000e+002  1.8100000e+000
  3.0000000e+001  1.3000000e+002  1.4400000e+000
  4.0000000e+001  1.3000000e+002  9.7000000e-001
  5.0000000e+001  1.3000000e+002  4.3000000e-001
  6.0000000e+001  1.3000000e+002 -1.0000000e-001
  7.0000000e+001  1.3000000e+002 -5.8000000e-001
  8.0000000e+001  1.3000000e+002 -9.0000000e-001
  9.0000000e+001  1.3000000e+002 -1.0200000e+000
  1.0000000e+002  1.3000000e+002 -9.0000000e-001
  1.1000000e+002  1.3000000e+002 -5.8000000e-001
  1.2000000e+002  1.3000000e+002 -1.0000000e-001
  1.3000000e+002  1.3000000e+002  4.3000000e-001
  1.4000000e+002  1.3000000e+002  9.7000000e-001
  1.5000000e+002  1.3000000e+002  1.4400000e+000
  1.6000000e+002  1.3000000e+002  1.8100000e+000
  1.7000000e+002  1.3000000e+002  2.0400000e+000
  1.8000000e+002  1.3000000e+002  2.1200000e+000
  0.0000000e+000  1.4000000e+002  2.1200000e+000
  1.0000000e+001  1.4000000e+002  2.0100000e+000
  2.0000000e+001  1.4000000e+002  1.6800000e+000
  3.0000000e+001  1.4000000e+002  1.1400000e+000
  4.0000000e+001  1.4000000e+002  4.3000000e-001
  5.0000000e+001  1.4000000e+002 -4.0000000e-001
  6.0000000e+001  1.4000000e+002 -1.2700000e+000
  7.0000000e+001  1.4000000e+002 -2.0800000e+000
  8.0000000e+001  1.4000000e+002 -2.6700000e+000
  9.0000000e+001  1.4000000e+002 -2.8900000e+000
  1.0000000e+002  1.4000000e+002 -2.6700000e+000
  1.1000000e+002  1.4000000e+002 -2.0800000e+000
  1.2000000e+002  1.4000000e+002 -1.2700000e+000
  1.3000000e+002  1.4000000e+002 -4.0000000e-001
  1.4000000e+002  1.4000000e+002  4.3000000e-001
  1.5000000e+002  1.4000000e+002  1.1400000e+000
  1.6000000e+002  1.4000000e+002  1.6800000e+000
  1.7000000e+002  1.4000000e+002  2.0100000e+000
  1.8000000e+002  1.4000000e+002  2.1200000e+000
  0.0000000e+000  1.5000000e+002  2.1200000e+000
  1.0000000e+001  1.5000000e+002  1.9800000e+000
  2.0000000e+001  1.5000000e+002  1.5500000e+000
  3.0000000e+001  1.5000000e+002  8.5000000e-001
  4.0000000e+001  1.5000000e+002 -1.0000000e-001
  5.0000000e+001  1.5000000e+002 -1.2700000e+000
  6.0000000e+001  1.5000000e+002 -2.5900000e+000
  7.0000000e+001  1.5000000e+002 -3.9200000e+000
  8.0000000e+001  1.5000000e+002 -4.9800000e+000
  9.0000000e+001  1.5000000e+002 -5.4100000e+000
  1.0000000e+002  1.5000000e+002 -4.9800000e+000
  1.1000000e+002  1.5000000e+002 -3.9200000e+000
  1.2000000e+002  1.5000000e+002 -2.5900000e+000
  1.3000000e+002  1.5000000e+002 -1.2700000e+000
  1.4000000e+002  1.5000000e+002 -1.0000000e-001
  1.5000000e+002  1.5000000e+002  8.5000000e-001
  1.6000000e+002  1.5000000e+002  1.5500000e+000
  1.7000000e+002  1.5000000e+002  1.9800000e+000
  1.8000000e+002  1.5000000e+002  2.1200000e+000
  0.0000000e+000  1.6000000e+002  2.1200000e+000
  1.0000000e+001  1.6000000e+002  1.9500000e+000
  2.0000000e+001  1.6000000e+002  1.4400000e+000
  3.0000000e+001  1.6000000e+002  6.0000000e-001
  4.0000000e+001  1.6000000e+002 -5.8000000e-001
  5.0000000e+001  1.6000000e+002 -2.0800000e+000
  6.0000000e+001  1.6000000e+002 -3.9200000e+000
  7.0000000e+001  1.6000000e+002 -6.0200000e+000
  8.0000000e+001  1.6000000e+002 -8.0300000e+000
  9.0000000e+001  1.6000000e+002 -8.9800000e+000
  1.0000000e+002  1.6000000e+002 -8.0300000e+000
  1.1000000e+002  1.6000000e+002 -6.0200000e+000
  1.2000000e+002  1.6000000e+002 -3.9200000e+000
  1.3000000e+002  1.6000000e+002 -2.0800000e+000
  1.4000000e+002  1.6000000e+002 -5.8000000e-001
  1.5000000e+002  1.6000000e+002  6.0000000e-001
  1.6000000e+002  1.6000000e+002  1.4400000e+000
  1.7000000e+002  1.6000000e+002  1.9500000e+000
  1.8000000e+002  1.6000000e+002  2.1200000e+000
  0.0000000e+000  1.7000000e+002  2.1200000e+000
  1.0000000e+001  1.7000000e+002  1.9300000e+000
  2.0000000e+001  1.7000000e+002  1.3700000e+000
  3.0000000e+001  1.7000000e+002  4.3000000e-001
  4.0000000e+001  1.7000000e+002 -9.0000000e-001
  5.0000000e+001  1.7000000e+002 -2.6700000e+000
  6.0000000e+001  1.7000000e+002 -4.9800000e+000
  7.0000000e+001  1.7000000e+002 -8.0300000e+000
  8.0000000e+001  1.7000000e+002 -1.2040000e+001
  9.0000000e+001  1.7000000e+002 -1.5050000e+001
  1.0000000e+002  1.7000000e+002 -1.2040000e+001
  1.1000000e+002  1.7000000e+002 -8.0300000e+000
  1.2000000e+002  1.7000000e+002 -4.9800000e+000
  1.3000000e+002  1.7000000e+002 -2.6700000e+000
  1.4000000e+002  1.7000000e+002 -9.0000000e-001
  1.5000000e+002  1.7000000e+002  4.3000000e-001
  1.6000000e+002  1.7000000e+002  1.3700000e+000
  1.7000000e+002  1.7000000e+002  1.9300000e+000
  1.8000000e+002  1.7000000e+002  2.1200000e+000
  0.0000000e+000  1.8000000e+002  2.1200000e+000
  1.0000000e+001  1.8000000e+002  1.9300000e+000
  2.0000000e+001  1.8000000e+002  1.3500000e+000
  3.0000000e+001  1.8000000e+002  3.8000000e-001
  4.0000000e+001  1.8000000e+002 -1.0200000e+000
  5.0000000e+001  1.8000000e+002 -2.8900000e+000
  6.0000000e+001  1.8000000e+002 -5.4100000e+000
  7.0000000e+001  1.8000000e+002 -8.9800000e+000
  8.0000000e+001  1.8000000e+002 -1.5050000e+001
  9.0000000e+001  1.8000000e+002 -9.9999000e+002
  1.0000000e+002  1.8000000e+002 -1.5050000e+001
  1.1000000e+002  1.8000000e+002 -8.9800000e+000
  1.2000000e+002  1.8000000e+002 -5.4100000e+000
  1.3000000e+002  1.8000000e+002 -2.8900000e+000
  1.4000000e+002  1.8000000e+002 -1.0200000e+000
  1.5000000e+002  1.8000000e+002  3.8000000e-001
  1.6000000e+002  1.8000000e+002  1.3500000e+000
  1.7000000e+002  1.8000000e+002  1.9300000e+000
  1.8000000e+002  1.8000000e+002  2.1200000e+000
  0.0000000e+000  1.9000000e+002  2.1200000e+000
  1.0000000e+001  1.9000000e+002  1.9300000e+000
  2.0000000e+001  1.9000000e+002  1.3700000e+000
  3.0000000e+001  1.9000000e+002  4.3000000e-001
  4.0000000e+001  1.9000000e+002 -9.0000000e-001
  5.0000000e+001  1.9000000e+002 -2.6700000e+000
  6.0000000e+001  1.9000000e+002 -4.9800000e+000
  7.0000000e+001  1.9000000e+002 -8.0300000e+000
  8.0000000e+001  1.9000000e+002 -1.2040000e+001
  9.0000000e+001  1.9000000e+002 -1.5050000e+001
  1.0000000e+002  1.9000000e+002 -1.2040000e+001
  1.1000000e+002  1.9000000e+002 -8.0300000e+000
  1.2000000e+002  1.9000000e+002 -4.9800000e+000
  1.3000000e+002  1.9000000e+002 -2.6700000e+000
  1.4000000e+002  1.9000000e+002 -9.0000000e-001
  1.5000000e+002  1.9000000e+002  4.3000000e-001
  1.6000000e+002  1.9000000e+002  1.3700000e+000
  1.7000000e+002  1.9000000e+002  1.9300000e+000
  1.8000000e+002  1.9000000e+002  2.1200000e+000
  0.0000000e+000  2.0000000e+002  2.1200000e+000
  1.0000000e+001  2.0000000e+002  1.9500000e+000
  2.0000000e+001  2.0000000e+002  1.4400000e+000
  3.0000000e+001  2.0000000e+002  6.0000000e-001
  4.0000000e+001  2.0000000e+002 -5.8000000e-001
  5.0000000e+001  2.0000000e+002 -2.0800000e+000
  6.0000000e+001  2.0000000e+002 -3.9200000e+000
  7.0000000e+001  2.0000000e+002 -6.0200000e+000
  8.0000000e+001  2.0000000e+002 -8.0300000e+000
  9.0000000e+001  2.0000000e+002 -8.9800000e+000
  1.0000000e+002  2.0000000e+002 -8.0300000e+000
  1.1000000e+002  2.0000000e+002 -6.0200000e+000
  1.2000000e+002  2.0000000e+002 -3.9200000e+000
  1.3000000e+002  2.0000000e+002 -2.0800000e+000
  1.4000000e+002  2.0000000e+002 -5.8000000e-001
  1.5000000e+002  2.0000000e+002  6.0000000e-001
  1.6000000e+002  2.0000000e+002  1.4400000e+000
  1.7000000e+002  2.0000000e+002  1.9500000e+000
  1.8000000e+002  2.0000000e+002  2.1200000e+000
  0.0000000e+000  2.1000000e+002  2.1200000e+000
  1.0000000e+001  2.1000000e+002  1.9800000e+000
  2.0000000e+001  2.1000000e+002  1.5500000e+000
  3.0000000e+001  2.1000000e+002  8.5000000e-001
  4.0000000e+001  2.1000000e+002 -1.0000000e-001
  5.0000000e+001  2.1000000e+002 -1.2700000e+000
  6.0000000e+001  2.1000000e+002 -2.5900000e+000
  7.0000000e+001  2.1000000e+002 -3.9200000e+000
  8.0000000e+001  2.1000000e+002 -4.9800000e+000
  9.0000000e+001  2.1000000e+002 -5.4100000e+000
  1.0000000e+002  2.1000000e+002 -4.9800000e+000
  1.1000000e+002  2.1000000e+002 -3.9200000e+000
  1.2000000e+002  2.1000000e+002 -2.5900000e+000
  1.3000000e+002  2.1000000e+002 -1.2700000e+000
  1.4000000e+002  2.1000000e+002 -1.0000000e-001
  1.5000000e+002  2.1000000e+002  8.5000000e-001
  1.6000000e+002  2.1000000e+002  1.5500000e+000
  1.7000000e+002  2.1000000e+002  1.9800000e+000
  1.8000000e+002  2.1000000e+002  2.1200000e+000
  0.0000000e+000  2.2000000e+002  2.1200000e+000
  1.0000000e+001  2.2000000e+002  2.0100000e+000
  2.0000000e+001  2.2000000e+002  1.6800000e+000
  3.0000000e+001  2.2000000e+002  1.1400000e+000
  4.0000000e+001  2.2000000e+002  4.3000000e-001
  5.0000000e+001  2.2000000e+002 -4.0000000e-001
  6.0000000e+001  2.2000000e+002 -1.2700000e+000
  7.0000000e+001  2.2000000e+002 -2.0800000e+000
  8.0000000e+001  2.2000000e+002 -2.6700000e+000
  9.0000000e+001  2.2000000e+002 -2.8900000e+000
  1.0000000e+002  2.2000000e+002 -2.6700000e+000
  1.1000000e+002  2.2000000e+002 -2.0800000e+000
  1.2000000e+002  2.2000000e+002 -1.2700000e+000
  1.3000000e+002  2.2000000e+002 -4.0000000e-001
  1.4000000e+002  2.2000000e+002  4.3000000e-001
  1.5000000e+002  2.2000000e+002  1.1400000e+000
  1.6000000e+002  2.2000000e+002  1.6800000e+000
  1.7000000e+002  2.2000000e+002  2.0100000e+000
  1.8000000e+002  2.2000000e+002  2.1200000e+000
  0.0000000e+000  2.3000000e+002  2.1200000e+000
  1.0000000e+001  2.3000000e+002  2.0400000e+000
  2.0000000e+001  2.3000000e+002  1.8100000e+000
  3.0000000e+001  2.3000000e+002  1.4400000e+000
  4.0000000e+001  2.3000000e+002  9.7000000e-001
  5.0000000e+001  2.3000000e+002  4.3000000e-001
  6.0000000e+001  2.3000000e+002 -1.0000000e-001
  7.0000000e+001  2.3000000e+002 -5.8000000e-001
  8.0000000e+001  2.3000000e+002 -9.0000000e-001
  9.0000000e+001  2.3000000e+002 -1.0200000e+000
  1.0000000e+002  2.3000000e+002 -9.0000000e-001
  1.1000000e+002  2.3000000e+002 -5.8000000e-001
  1.2000000e+002  2.3000000e+002 -1.0000000e-001
  1.3000000e+002  2.3000000e+002  4.3000000e-001
  1.4000000e+002  2.3000000e+002  9.7000000e-001
  1.5000000e+002  2.3000000e+002  1.4400000e+000
  1.6000000e+002  2.3000000e+002  1.8100000e+000
  1.7000000e+002  2.3000000e+002  2.0400000e+000
  1.8000000e+002  2.3000000e+002  2.1200000e+000
  0.0000000e+000  2.4000000e+002  2.1200000e+000
  1.0000000e+001  2.4000000e+002  2.0700000e+000
  2.0000000e+001  2.4000000e+002  1.9300000e+000
  3.0000000e+001  2.4000000e+002  1.7200000e+000
  4.0000000e+001  2.4000000e+002  1.4400000e+000
  5.0000000e+001  2.4000000e+002  1.1400000e+000
  6.0000000e+001  2.4000000e+002  8.5000000e-001
  7.0000000e+001  2.4000000e+002  6.0000000e-001
  8.0000000e+001  2.4000000e+002  4.3000000e-001
  9.0000000e+001  2.4000000e+002  3.8000000e-001
  1.0000000e+002  2.4000000e+002  4.3000000e-001
  1.1000000e+002  2.4000000e+002  6.0000000e-001
  1.2000000e+002  2.4000000e+002  8.5000000e-001
  1.3000000e+002  2.4000000e+002  1.1400000e+000
  1.4000000e+002  2.4000000e+002  1.4400000e+000
  1.5000000e+002  2.4000000e+002  1.7200000e+000
  1.6000000e+002  2.4000000e+002  1.9300000e+000
  1.7000000e+002  2.4000000e+002  2.0700000e+000
  1.8000000e+002  2.4000000e+002  2.1200000e+000
  0.0000000e+000  2.5000000e+002  2.1200000e+000
  1.0000000e+001  2.5000000e+002  2.1000000e+000
  2.0000000e+001  2.5000000e+002  2.0300000e+000
  3.0000000e+001  2.5000000e+002  1.9300000e+000
  4.0000000e+001  2.5000000e+002  1.8100000e+000
  5.0000000e+001  2.5000000e+002  1.6800000e+000
  6.0000000e+001  2.5000000e+002  1.5500000e+000
  7.0000000e+001  2.5000000e+002  1.4400000e+000
  8.0000000e+001  2.5000000e+002  1.3700000e+000
  9.0000000e+001  2.5000000e+002  1.3500000e+000
  1.0000000e+002  2.5000000e+002  1.3700000e+000
  1.1000000e+002  2.5000000e+002  1.4400000e+000
  1.2000000e+002  2.5000000e+002  1.5500000e+000
  1.3000000e+002  2.5000000e+002  1.6800000e+000
  1.4000000e+002  2.5000000e+002  1.8100000e+000
  1.5000000e+002  2.5000000e+002  1.9300000e+000
  1.6000000e+002  2.5000000e+002  2.0300000e+000
  1.7000000e+002  2.5000000e+002  2.1000000e+000
  1.8000000e+002  2.5000000e+002  2.1200000e+000
  0.0000000e+000  2.6000000e+002  2.1200000e+000
  1.0000000e+001  2.6000000e+002  2.1100000e+000
  2.0000000e+001  2.6000000e+002  2.1000000e+000
  3.0000000e+001  2.6000000e+002  2.0700000e+000
  4.0000000e+001  2.6000000e+002  2.0400000e+000
  5.0000000e+001  2.6000000e+002  2.0100000e+000
  6.0000000e+001  2.6000000e+002  1.9800000e+000
  7.0000000e+001  2.6000000e+002  1.9500000e+000
  8.0000000e+001  2.6000000e+002  1.9300000e+000
  9.0000000e+001  2.6000000e+002  1.9300000e+000
  1.0000000e+002  2.6000000e+002  1.9300000e+000
  1.1000000e+002  2.6000000e+002  1.9500000e+000
  1.2000000e+002  2.6000000e+002  1.9800000e+000
  1.3000000e+002  2.6000000e+002  2.0100000e+000
  1.4000000e+002  2.6000000e+002  2.0400000e+000
  1.5000000e+002  2.6000000e+002  2.0700000e+000
  1.6000000e+002  2.6000000e+002  2.1000000e+000
  1.7000000e+002  2.6000000e+002  2.1100000e+000
  1.8000000e+002  2.6000000e+002  2.1200000e+000
  0.0000000e+000  2.7000000e+002  2.1200000e+000
  1.0000000e+001  2.7000000e+002  2.1200000e+000
  2.0000000e+001  2.7000000e+002  2.1200000e+000
  3.0000000e+001  2.7000000e+002  2.1200000e+000
  4.0000000e+001  2.7000000e+002  2.1200000e+000
  5.0000000e+001  2.7000000e+002  2.1200000e+000
  6.0000000e+001  2.7000000e+002  2.1200000e+000
  7.0000000e+001  2.7000000e+002  2.1200000e+000
  8.0000000e+001  2.7000000e+002  2.1200000e+000
  9.0000000e+001  2.7000000e+002  2.1200000e+000
  1.0000000e+002  2.7000000e+002  2.1200000e+000
  1.1000000e+002  2.7000000e+002  2.1200000e+000
  1.2000000e+002  2.7000000e+002  2.1200000e+000
  1.3000000e+002  2.7000000e+002  2.1200000e+000
  1.4000000e+002  2.7000000e+002  2.1200000e+000
  1.5000000e+002  2.7000000e+002  2.1200000e+000
  1.6000000e+002  2.7000000e+002  2.1200000e+000
  1.7000000e+002  2.7000000e+002  2.1200000e+000
  1.8000000e+002  2.7000000e+002  2.1200000e+000
  0.0000000e+000  2.8000000e+002  2.1200000e+000
  1.0000000e+001  2.8000000e+002  2.1100000e+000
  2.0000000e+001  2.8000000e+002  2.1000000e+000
  3.0000000e+001  2.8000000e+002  2.0700000e+000
  4.0000000e+001  2.8000000e+002  2.0400000e+000
  5.0000000e+001  2.8000000e+002  2.0100000e+000
  6.0000000e+001  2.8000000e+002  1.9800000e+000
  7.0000000e+001  2.8000000e+002  1.9500000e+000
  8.0000000e+001  2.8000000e+002  1.9300000e+000
  9.0000000e+001  2.8000000e+002  1.9300000e+000
  1.0000000e+002  2.8000000e+002  1.9300000e+000
  1.1000000e+002  2.8000000e+002  1.9500000e+000
  1.2000000e+002  2.8000000e+002  1.9800000e+000
  1.3000000e+002  2.8000000e+002  2.0100000e+000
  1.4000000e+002  2.8000000e+002  2.0400000e+000
  1.5000000e+002  2.8000000e+002  2.0700000e+000
  1.6000000e+002  2.8000000e+002  2.1000000e+000
  1.7000000e+002  2.8000000e+002  2.1100000e+000
  1.8000000e+002  2.8000000e+002  2.1200000e+000
  0.0000000e+000  2.9000000e+002  2.1200000e+000
  1.0000000e+001  2.9000000e+002  2.1000000e+000
  2.0000000e+001  2.9000000e+002  2.0300000e+000
  3.0000000e+001  2.9000000e+002  1.9300000e+000
  4.0000000e+001  2.9000000e+002  1.8100000e+000
  5.0000000e+001  2.9000000e+002  1.6800000e+000
  6.0000000e+001  2.9000000e+002  1.5500000e+000
  7.0000000e+001  2.9000000e+002  1.4400000e+000
  8.0000000e+001  2.9000000e+002  1.3700000e+000
  9.0000000e+001  2.9000000e+002  1.3500000e+000
  1.0000000e+002  2.9000000e+002  1.3700000e+000
  1.1000000e+002  2.9000000e+002  1.4400000e+000
  1.2000000e+002  2.9000000e+002  1.5500000e+000
  1.3000000e+002  2.9000000e+002  1.6800000e+000
  1.4000000e+002  2.9000000e+002  1.8100000e+000
  1.5000000e+002  2.9000000e+002  1.9300000e+000
  1.6000000e+002  2.9000000e+002  2.0300000e+000
  1.7000000e+002  2.9000000e+002  2.1000000e+000
  1.8000000e+002  2.9000000e+002  2.1200000e+000
  0.0000000e+000  3.0000000e+002  2.1200000e+000
  1.0000000e+001  3.0000000e+002  2.0700000e+000
  2.0000000e+001  3.0000000e+002  1.9300000e+000
  3.0000000e+001  3.0000000e+002  1.7200000e+000
  4.0000000e+001  3.0000000e+002  1.4400000e+000
  5.0000000e+001  3.0000000e+002  1.1400000e+000
  6.0000000e+001  3.0000000e+002  8.5000000e-001
  7.0000000e+001  3.0000000e+002  6.0000000e-001
  8.0000000e+001  3.0000000e+002  4.3000000e-001
  9.0000000e+001  3.0000000e+002  3.8000000e-001
  1.0000000e+002  3.0000000e+002  4.3000000e-001
  1.1000000e+002  3.0000000e+002  6.0000000e-001
  1.2000000e+002  3.0000000e+002  8.5000000e-001
  1.3000000e+002  3.0000000e+002  1.1400000e+000
  1.4000000e+002  3.0000000e+002  1.4400000e+000
  1.5000000e+002  3.0000000e+002  1.7200000e+000
  1.6000000e+002  3.0000000e+002  1.9300000e+000
  1.7000000e+002  3.0000000e+002  2.0700000e+000
  1.8000000e+002  3.0000000e+002  2.1200000e+000
  0.0000000e+000  3.1000000e+002  2.1200000e+000
  1.0000000e+001  3.1000000e+002  2.0400000e+000
  2.0000000e+001  3.1000000e+002  1.8100000e+000
  3.0000000e+001  3.1000000e+002  1.4400000e+000
  4.0000000e+001  3.1000000e+002  9.7000000e-001
  5.0000000e+001  3.1000000e+002  4.3000000e-001
  6.0000000e+001  3.1000000e+002 -1.0000000e-001
  7.0000000e+001  3.1000000e+002 -5.8000000e-001
  8.0000000e+001  3.1000000e+002 -9.0000000e-001
  9.0000000e+001  3.1000000e+002 -1.0200000e+000
  1.0000000e+002  3.1000000e+002 -9.0000000e-001
  1.1000000e+002  3.1000000e+002 -5.8000000e-001
  1.2000000e+002  3.1000000e+002 -1.0000000e-001
  1.3000000e+002  3.1000000e+002  4.3000000e-001
  1.4000000e+002  3.1000000e+002  9.7000000e-001
  1.5000000e+002  3.1000000e+002  1.4400000e+000
  1.6000000e+002  3.1000000e+002  1.8100000e+000
  1.7000000e+002  3.1000000e+002  2.0400000e+000
  1.8000000e+002  3.1000000e+002  2.1200000e+000
  0.0000000e+000  3.2000000e+002  2.1200000e+000
  1.0000000e+001  3.2000000e+002  2.0100000e+000
  2.0000000e+001  3.2000000e+002  1.6800000e+000
  3.0000000e+001  3.2000000e+002  1.1400000e+000
  4.0000000e+001  3.2000000e+002  4.3000000e-001
  5.0000000e+001  3.2000000e+002 -4.0000000e-001
  6.0000000e+001  3.2000000e+002 -1.2700000e+000
  7.0000000e+001  3.2000000e+002 -2.0800000e+000
  8.0000000e+001  3.2000000e+002 -2.6700000e+000
  9.0000000e+001  3.2000000e+002 -2.8900000e+000
  1.0000000e+002  3.2000000e+002 -2.6700000e+000
  1.1000000e+002  3.2000000e+002 -2.0800000e+000
  1.2000000e+002  3.2000000e+002 -1.2700000e+000
  1.3000000e+002  3.2000000e+002 -4.0000000e-001
  1.4000000e+002  3.2000000e+002  4.3000000e-001
  1.5000000e+002  3.2000000e+002  1.1400000e+000
  1.6000000e+002  3.2000000e+002  1.6800000e+000
  1.7000000e+002  3.2000000e+002  2.0100000e+000
  1.8000000e+002  3.2000000e+002  2.1200000e+000
  0.0000000e+000  3.3000000e+002  2.1200000e+000
  1.0000000e+001  3.3000000e+002  1.9800000e+000
  2.0000000e+001  3.3000000e+002  1.5500000e+000
  3.0000000e+001  3.3000000e+002  8.5000000e-001
  4.0000000e+001  3.3000000e+002 -1.0000000e-001
  5.0000000e+001  3.3000000e+002 -1.2700000e+000
  6.0000000e+001  3.3000000e+002 -2.5900000e+000
  7.0000000e+001  3.3000000e+002 -3.9200000e+000
  8.0000000e+001  3.3000000e+002 -4.9800000e+000
  9.0000000e+001  3.3000000e+002 -5.4100000e+000
  1.0000000e+002  3.3000000e+002 -4.9800000e+000
  1.1000000e+002  3.3000000e+002 -3.9200000e+000
  1.2000000e+002  3.3000000e+002 -2.5900000e+000
  1.3000000e+002  3.3000000e+002 -1.2700000e+000
  1.4000000e+002  3.3000000e+002 -1.0000000e-001
  1.5000000e+002  3.3000000e+002  8.5000000e-001
  1.6000000e+002  3.3000000e+002  1.5500000e+000
  1.7000000e+002  3.3000000e+002  1.9800000e+000
  1.8000000e+002  3.3000000e+002  2.1200000e+000
  0.0000000e+000  3.4000000e+002  2.1200000e+000
  1.0000000e+001  3.4000000e+002  1.9500000e+000
  2.0000000e+001  3.4000000e+002  1.4400000e+000
  3.0000000e+001  3.4000000e+002  6.0000000e-001
  4.0000000e+001  3.4000000e+002 -5.8000000e-001
  5.0000000e+001  3.4000000e+002 -2.0800000e+000
  6.0000000e+001  3.4000000e+002 -3.9200000e+000
  7.0000000e+001  3.4000000e+002 -6.0200000e+000
  8.0000000e+001  3.4000000e+002 -8.0300000e+000
  9.0000000e+001  3.4000000e+002 -8.9800000e+000
  1.0000000e+002  3.4000000e+002 -8.0300000e+000
  1.1000000e+002  3.4000000e+002 -6.0200000e+000
  1.2000000e+002  3.4000000e+002 -3.9200000e+000
  1.3000000e+002  3.4000000e+002 -2.0800000e+000
  1.4000000e+002  3.4000000e+002 -5.8000000e-001
  1.5000000e+002  3.4000000e+002  6.0000000e-001
  1.6000000e+002  3.4000000e+002  1.4400000e+000
  1.7000000e+002  3.4000000e+002  1.9500000e+000
  1.8000000e+002  3.4000000e+002  2.1200000e+000
  0.0000000e+000  3.5000000e+002  2.1200000e+000
  1.0000000e+001  3.5000000e+002  1.9300000e+000
  2.0000000e+001  3.5000000e+002  1.3700000e+000
  3.0000000e+001  3.5000000e+002  4.3000000e-001
  4.0000000e+001  3.5000000e+002 -9.0000000e-001
  5.0000000e+001  3.5000000e+002 -2.6700000e+000
  6.0000000e+001  3.5000000e+002 -4.9800000e+000
  7.0000000e+001  3.5000000e+002 -8.0300000e+000
  8.0000000e+001  3.5000000e+002 -1.2040000e+001
  9.0000000e+001  3.5000000e+002 -1.5050000e+001
  1.0000000e+002  3.5000000e+002 -1.2040000e+001
  1.1000000e+002  3.5000000e+002 -8.0300000e+000
  1.2000000e+002  3.5000000e+002 -4.9800000e+000
  1.3000000e+002  3.5000000e+002 -2.6700000e+000
  1.4000000e+002  3.5000000e+002 -9.0000000e-001
  1.5000000e+002  3.5000000e+002  4.3000000e-001
  1.6000000e+002  3.5000000e+002  1.3700000e+000
  1.7000000e+002  3.5000000e+002  1.9300000e+000
  1.8000000e+002  3.5000000e+002  2.1200000e+000
  0.0000000e+000  3.6000000e+002  2.1200000e+000
  1.0000000e+001  3.6000000e+002  1.9300000e+000
  2.0000000e+001  3.6000000e+002  1.3500000e+000
  3.0000000e+001  3.6000000e+002  3.8000000e-001
  4.0000000e+001  3.6000000e+002 -1.0200000e+000
  5.0000000e+001  3.6000000e+002 -2.8900000e+000
  6.0000000e+001  3.6000000e+002 -5.4100000e+000
  7.0000000e+001  3.6000000e+002 -8.9800000e+000
  8.0000000e+001  3.6000000e+002 -1.5050000e+001
  9.0000000e+001  3.6000000e+002 -9.9999000e+002
  1.0000000e+002  3.6000000e+002 -1.5050000e+001
  1.1000000e+002  3.6000000e+002 -8.9800000e+000
  1.2000000e+002  3.6000000e+002 -5.4100000e+000
  1.3000000e+002  3.6000000e+002 -2.8900000e+000
  1.4000000e+002  3.6000000e+002 -1.0200000e+000
  1.5000000e+002  3.6000000e+002  3.8000000e-001
  1.6000000e+002  3.6000000e+002  1.3500000e+000
  1.7000000e+002  3.6000000e+002  1.9300000e+000
  1.8000000e+002  3.6000000e+002  2.1200000e+000];

global interp_config;                                  % Initialise interp_config variable
freq_config=300e6;                                     % Frequency at which NEC data was calculated
lambda=3e8/freq_config;                                % Calculate lambda
                      
dipole_config=[lambda/2];                              % Define dipole element (for graphical purposes only)
rect_array(1,1,(0.5*lambda),(0.5*lambda),'dipole',0);  % Define a 1 element array of dipole elements,
interp_config=array_config;                            % used to pass geometry to the interp_geom function.
                                                       % To draw only the coloured axes for each element use 'iso'
                                                       % as the array element in this section.
   
clear_array;                                           % Clear the array


rect_array(1,4,(0.5*lambda),(0.5*lambda),'interp',0);  % Define a 1x4 element array of 'interp' elements..
%squint_array(25,90,1);                                % Set array phasing to squint beam to theta=25 phi=90 ref_ele=1
                                                       % Un-comment to alter phases of the 'interp' elements and
                                                       % steer the array.

list_array(0);                                         % List array details
plot_geom3d(1,0);                                      % Plot 3D geometry with global axes
plot_theta(-180,2,180,[90,0],'tot','first');           % Plot full circle theta patterns for phi=0 and 90 deg