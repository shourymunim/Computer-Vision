close all;
clc;
clear all;

numImages = 10;
files = cell(1, numImages);
for i = 1:numImages
    files{i} = fullfile(sprintf('img%d.tif', i));
end

magnification = 25;

% Detect the checkerboard corners in the images.
[imagePoints, boardSize] = detectCheckerboardPoints(files);

% Generate the world coordinates of the checkerboard corners in the
% pattern-centric coordinate system, with the upper-left corner at (0,0).
squareSize = 23; % in millimeters
worldPoints = generateCheckerboardPoints(boardSize, squareSize);

% Calibrate the camera.
cameraParams = estimateCameraParameters(imagePoints, worldPoints);

imOrig = imread( 'object.jpg');
[im, newOrigin] = undistortImage(imOrig, cameraParams, 'OutputView', 'full');

% Convert the image to the HSV color space.
imHSV = rgb2hsv(im);

% Get the saturation channel.
saturation = imHSV(:, :, 2);

% Threshold the image
t = graythresh(saturation);
imCoin = (saturation > t);

figure; imshow(imCoin, 'InitialMagnification', magnification);