%熟悉MATLAB图像处理的常用函数
%熟悉RGB，灰度图像，二值图像，索引图像的装换。
Img=imread('img\cd1.jpg');%读图，真彩图像
subplot(221),imshow(Img),title('原始图像');

Img_gray = rgb2gray(Img);%真彩变灰度图像
subplot(222),imshow(Img_gray ),title('灰度图像');

Img_2b=im2bw(Img,0.5);%真彩变二值图像
subplot(223),imshow(Img_2b),title('二值图像');

Img_index=rgb2ind(Img,128);%真彩变索引图像
subplot(224),imshow(Img_index),title('索引色图像'); 



