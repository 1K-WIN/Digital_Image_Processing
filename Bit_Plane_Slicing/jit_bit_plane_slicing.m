% Created on 23/01/25
% Created by Sahatrajit B., BT22ECE093
% Third Practical ~ Bit-plane Slicing on an Image.


clc
clear all
close all

% Reading an Image and creating the Grayscale version
I = imread ("ghibli.png");
I_c1 = I(:,:,1);
I_c2 = I(:,:,2);
I_c3 = I(:,:,3);
I = round(0.299*I_c1+0.587*I_c2+0.114*I_c3);

% Extracting all 8-bits one by one
I_d = double(I);
I1 = mod(I_d, 2);
I2 = mod(floor(I_d/2), 2);
I3 = mod(floor(I_d/4), 2);
I4 = mod(floor(I_d/8), 2);
I5 = mod(floor(I_d/16), 2);
I6 = mod(floor(I_d/32), 2);
I7 = mod(floor(I_d/64), 2);
I8 = mod(floor(I_d/128), 2);

% Creating the Image without the LSB-plane
I_new = (2^0)*I2 + (2^1)*I3 + (2^2)*I4 + (2^3)*I5 + (2^4)*I6 + (2^5)*I7 + (2^6)*I8; 

% Plotting input Image vs new Image
figure
subplot(1, 2, 1), imshow(I), title('Input Image (8bit)');
subplot(1, 2, 2), imshow(uint8(I_new)), title('Compressed Image w/o LSB (7bit)');

% Plotting all 8-bit Plane Images
figure
subplot(2, 4, 1), imshow(I8), title('Bit Plane 8'), xlabel("Most Information");
subplot(2, 4, 2), imshow(I7), title('Bit Plane 7');
subplot(2, 4, 3), imshow(I6), title('Bit Plane 6');
subplot(2, 4, 4), imshow(I5), title('Bit Plane 5');
subplot(2, 4, 5), imshow(I4), title('Bit Plane 4');
subplot(2, 4, 6), imshow(I3), title('Bit Plane 3');
subplot(2, 4, 7), imshow(I2), title('Bit Plane 2');
subplot(2, 4, 8), imshow(I1), title('Bit Plane 1'), xlabel({'Least Information','Removed in New Image'});
