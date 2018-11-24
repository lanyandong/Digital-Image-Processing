%给图像添加不同的噪声（椒盐/高斯/瑞利），并去噪。
clear
img = imread('img\cd1.jpg');
subplot(221), imshow(img), title('原始图像');

% 加椒盐噪声，噪声密度为0.2
img_noise = imnoise(img, 'salt & pepper', 0.2);
subplot(222), imshow(img_noise), title('加椒盐噪声后的图像');

% 增加不同类型的噪声（更改注释）
% % 加高斯噪声，均值为0，方差为0.06
% img_noise = imnoise(img, 'gaussian', 0, 0.06);
% subplot(222), imshow(img_noise), title('加高斯噪声后的图像');

% % 加瑞利噪声,瑞利密度为100
% [x, y, z] = size(img);
% r = raylrnd(100, x, y, z);
% img_noise = min( uint8(r + double(img)), 255);
% subplot(222), imshow(img_noise), title('加瑞利噪声后的图像');


% 对加噪图像分通道处理
img_noise_r = img_noise( : , : , 1);
img_noise_g = img_noise( : , : , 2);
img_noise_b = img_noise( : , : , 3);


%中值滤波
%3×3滤波模板的中值滤波
Img_R = medfilt2(img_noise_r);
Img_G = medfilt2(img_noise_g);
Img_B = medfilt2(img_noise_b);

Img = cat(3, uint8(Img_R), uint8(Img_G), uint8(Img_B));
subplot(2,2,3), imshow(Img), title('3x3模板中值滤波图像'); 

%均值滤波
Img_ave_R = filter2(fspecial('average',3),img_noise_r); 
Img_ave_G = filter2(fspecial('average',3),img_noise_g); 
Img_ave_B = filter2(fspecial('average',3),img_noise_b); 

Img_ave = cat(3, uint8(Img_ave_R), uint8(Img_ave_G), uint8(Img_ave_B));
subplot(2,2,4), imshow(Img_ave), title('3x3模板均值滤波图像'); 



