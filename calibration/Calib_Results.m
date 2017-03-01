% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1876.591325741435000 ; 1865.041837058588500 ];

%-- Principal point:
cc = [ 1005.897869626700300 ; 530.523758869686050 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.062630242894941 ; 0.167715118033244 ; -0.002649598974606 ; -0.003428418338673 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 42.481665992074333 ; 42.206294398432917 ];

%-- Principal point uncertainty:
cc_error = [ 52.179720129747317 ; 50.930971394281123 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.068876522973634 ; 0.251536544941666 ; 0.009015068539505 ; 0.009322369785851 ; 0.000000000000000 ];

%-- Image size:
nx = 2048;
ny = 1152;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 10;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -2.197271e+000 ; -2.174034e+000 ; -1.085521e-001 ];
Tc_1  = [ -6.254517e+002 ; -4.909579e+002 ; 2.169062e+003 ];
omc_error_1 = [ 2.605831e-002 ; 2.544460e-002 ; 5.618145e-002 ];
Tc_error_1  = [ 6.121596e+001 ; 6.055502e+001 ; 6.060198e+001 ];

%-- Image #2:
omc_2 = [ 1.999983e+000 ; 1.902600e+000 ; 3.103137e-001 ];
Tc_2  = [ -5.586881e+002 ; -4.515098e+002 ; 1.806045e+003 ];
omc_error_2 = [ 2.339046e-002 ; 1.906926e-002 ; 4.137190e-002 ];
Tc_error_2  = [ 5.155066e+001 ; 5.042448e+001 ; 5.070291e+001 ];

%-- Image #3:
omc_3 = [ -1.512564e+000 ; -2.315547e+000 ; 4.706473e-002 ];
Tc_3  = [ -2.514455e+002 ; -5.659199e+002 ; 2.218278e+003 ];
omc_error_3 = [ 1.817918e-002 ; 2.736951e-002 ; 4.309241e-002 ];
Tc_error_3  = [ 6.190119e+001 ; 6.124214e+001 ; 5.521740e+001 ];

%-- Image #4:
omc_4 = [ 1.808472e+000 ; 1.776465e+000 ; 4.132911e-001 ];
Tc_4  = [ -8.448823e+002 ; -5.117548e+002 ; 1.856524e+003 ];
omc_error_4 = [ 2.114740e-002 ; 1.986916e-002 ; 3.572338e-002 ];
Tc_error_4  = [ 5.488513e+001 ; 5.345443e+001 ; 5.660181e+001 ];

%-- Image #5:
omc_5 = [ 1.845121e+000 ; 1.840317e+000 ; -6.655190e-001 ];
Tc_5  = [ -3.282811e+002 ; -3.922967e+002 ; 2.273239e+003 ];
omc_error_5 = [ 2.046951e-002 ; 2.514586e-002 ; 3.714794e-002 ];
Tc_error_5  = [ 6.352537e+001 ; 6.191246e+001 ; 4.616075e+001 ];

%-- Image #6:
omc_6 = [ 1.928470e+000 ; 2.319047e+000 ; -9.941877e-002 ];
Tc_6  = [ -5.713312e+002 ; -5.256242e+002 ; 2.481188e+003 ];
omc_error_6 = [ 2.416476e-002 ; 3.128925e-002 ; 5.915796e-002 ];
Tc_error_6  = [ 6.958418e+001 ; 6.871176e+001 ; 6.546366e+001 ];

%-- Image #7:
omc_7 = [ 1.844529e+000 ; 1.893099e+000 ; 6.625144e-001 ];
Tc_7  = [ -8.309771e+002 ; -4.204208e+002 ; 1.968899e+003 ];
omc_error_7 = [ 2.389955e-002 ; 1.873454e-002 ; 3.908223e-002 ];
Tc_error_7  = [ 5.782367e+001 ; 5.683915e+001 ; 6.123351e+001 ];

%-- Image #8:
omc_8 = [ -3.517720e-003 ; -3.012799e+000 ; -6.405978e-001 ];
Tc_8  = [ 6.354532e+002 ; -3.708755e+002 ; 1.677061e+003 ];
omc_error_8 = [ 1.061061e-002 ; 3.060791e-002 ; 4.392651e-002 ];
Tc_error_8  = [ 4.715193e+001 ; 4.779632e+001 ; 5.045875e+001 ];

%-- Image #9:
omc_9 = [ -1.987262e+000 ; -2.009792e+000 ; 4.635884e-001 ];
Tc_9  = [ -3.873357e+002 ; -4.681467e+002 ; 2.399012e+003 ];
omc_error_9 = [ 2.472169e-002 ; 2.056030e-002 ; 4.196834e-002 ];
Tc_error_9  = [ 6.677998e+001 ; 6.563459e+001 ; 5.354179e+001 ];

%-- Image #10:
omc_10 = [ 2.292885e+000 ; 1.442795e+000 ; 1.143703e+000 ];
Tc_10  = [ -5.984054e+002 ; -3.466793e+001 ; 2.216506e+003 ];
omc_error_10 = [ 3.223804e-002 ; 1.351027e-002 ; 4.142176e-002 ];
Tc_error_10  = [ 6.275347e+001 ; 6.163177e+001 ; 6.725465e+001 ];

