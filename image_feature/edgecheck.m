clear
img = imread('img\cd1.jpg');
I = rgb2gray(img);

BW1=edge(I,'roberts');  
BW2=edge(I,'sobel');
BW3=edge(I,'prewitt');
BW4=edge(I,'canny');
BW5=edge(I,'log');
figure;subplot(2,3,1);imshow(I);title('ԭʼͼ��');
subplot(2,3,2);imshow(BW1);title('Roberts����');
subplot(2,3,3);imshow(BW2);title('Sobel����');
subplot(2,3,4);imshow(BW3);title('Prewitt����');
subplot(2,3,5);imshow(BW4);title('Canny����');
subplot(2,3,6);imshow(BW5);title('Log���ӱ�Ե���');
