% Created on 16/01/25
% Created by Sahatrajit B., BT22ECE093
% Second Practical ~ Histogram Equalization of an Image.


clc
clear all
close all


c = 0;
n = 0:255;
count = 1:256;


% Reading an Image and creating the Grayscale version
I = imread ("Lenna.png");
I_c1 = I(:,:,1);
I_c2 = I(:,:,2);
I_c3 = I(:,:,3);
I = round(0.299*I_c1+0.587*I_c2+0.114*I_c3);


[Irows,Icols] = size(I);
tp = Irows*Icols;


% Calculating frequency of pixels having intensity 0:255
for ii = 1:256
    for jj = 1:Irows
        for kk = 1:Icols
            if(I(jj,kk) == ii-1)
                c = c+1;
            end
        end
    end
    count(ii) = c;
    c = 0;
end


% Calculating its CDF
I_eq = I;
I_cdf = cumsum(count);
I_cdf_min = min(I_cdf);


% Applying the formula for intensity values after equalization, h(v)
for ii = 1:Irows
    for jj = 1:Icols
        I_eq(ii,jj) = round((((I_cdf(I(ii,jj)+1))-(I_cdf_min))*255)/(tp-I_cdf_min));
    end
end


% Calculating frequency of pixels after equalization
for ii = 1:256
    for jj = 1:Irows
        for kk = 1:Icols
            if(I_eq(jj,kk) == ii-1)
                c = c+1;
            end
        end
    end
    Eq_count(ii) = c;
    c = 0;
end

% CDF of Equalized Image
I_eq_cdf = cumsum(Eq_count);


% Plotting input, result as well as their histograms
figure

subplot(2,3,1)
imshow(I), title("Input Image");

subplot(2,3,4)
imshow(I_eq), title("Equalized Image");

subplot(2,3,[2 3])
yyaxis left, stem(n,count,".")
yyaxis right, plot(n,(I_cdf/tp),'r-')
legend('Histogram','CDF', 'Location', 'northwest')
title("Histogram of Input Image");

subplot(2,3,[5 6])
yyaxis left, stem(n,Eq_count,".")
yyaxis right, plot(n,(I_eq_cdf/tp),'r-')
legend('Histogram','CDF', 'Location', 'northwest')
title("Histogram of Equalized Image");
