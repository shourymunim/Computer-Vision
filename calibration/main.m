% Finding object length
close all;
clc;
clear all;

%% Loading Calibration Result for samsung E5 camera

load('Calib_Results.mat');

%% Reading input image containing object

img=imread('object.jpg');
A=rgb2gray(img);
%figure; imshow(A, 'InitialMagnification', 50);
%title('Input Image');

%% Undistort the image

f=(fc(1)+fc(2))/2;
k1=kc(1);
k2=kc(2);
k3=kc(3);
p1=kc(4);
p2=kc(5);
ppx=cc(1);
ppy=cc(2);
newImg = undistortimage(A,f,ppx,ppy,k1,k2,k3,p1,p2);
%figure; imshow(newImg, 'InitialMagnification', 50);
%title('Undistorted Image');

%% Image Segmentation

imPen=newImg;
[row col]=size(imPen);
for i=1:row
    for j=1:col
        t=imPen(i,j);
        if t<100 
            imPen(i,j)=255;
        else
            imPen(i,j)=0;
        end
    end
end
%{
imHSV = rgb2hsv(img);
saturation = imHSV(:, :, 2);
t = graythresh(saturation);
imPen = (saturation > t);
%}
imPen=im2bw(imPen);
%% Finding Connectd Components(Bounding Boxes)

st = regionprops(imPen, 'BoundingBox', 'Area' );

for i = 1 : length(st)
  for j = 1: length(st)
      if st(i).Area>st(j).Area
          t=st(i);
          st(i)=st(j);
          st(j)=t;
      end
  end
end

for i=1:length(st)
    t=st(i).BoundingBox;
    if t(4)/t(3)> 4 && st(i).Area > 1000
        maxi=i;
    end
end
BB1=st(maxi).BoundingBox;

BB2=st(1).BoundingBox;

% Calculating Pen Length in the In put Image

squareSize=23; % One Checkbox= 23mm
bordSizeMM=23*8; % In mm
bordSizePX=BB2(4);
ppm=bordSizePX/bordSizeMM;
penLengthCalc=BB1(4)/ppm;
penLengthActual=154.25; % In mm
errorPercent=abs(penLengthCalc-penLengthActual)/penLengthCalc*100;
output_str=cell(3,1);
output_str{1}= ['Actual Pen Length:' num2str(penLengthActual) 'mm'];
output_str{2}= ['Calculated Pen Length:' num2str(penLengthCalc,'%0.2f') 'mm'];
output_str{3}= ['Percentage Error:' num2str(errorPercent,'%0.2f') '%.'];
position=[0 100;0 150;0 200];
RGB=insertText(img,position,output_str,'FontSize',40,'TextColor','red');
figure,imshow(RGB,'InitialMagnification',33),title('Output');
rectangle('Position', [BB1(1),BB1(2),BB1(3),BB1(4)],'EdgeColor','y','LineWidth',2 );
rectangle('Position', [BB2(1),BB2(2),BB2(3),BB2(4)],'EdgeColor','y','LineWidth',2 );

% END OF PROGRAM


