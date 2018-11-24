clear
img = imread('img\cd1.jpg');
subplot(221), imshow(img), title('ԭʼͼ��');

img_gray = rgb2gray(img);
subplot(222), imhist(img_gray), title('ԭʼͼ��ֱ��ͼ');

img_r = img( : , : , 1);
img_g = img( : , : , 2);
img_b = img( : , : , 3);

R = histeq(img_r);
G = histeq(img_g);
B = histeq(img_b);

Img = cat(3, R, G, B);
subplot(223), imshow(Img), title('RGB�ռ���⻯���ͼ��');
Img_gray = rgb2gray(Img);
subplot(224), imhist(Img_gray), title('RGB���⻯���ֱ��ͼ');






