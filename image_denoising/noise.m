%��ͼ����Ӳ�ͬ������������/��˹/����������ȥ�롣
clear
img = imread('img\cd1.jpg');
subplot(221), imshow(img), title('ԭʼͼ��');

% �ӽ��������������ܶ�Ϊ0.2
img_noise = imnoise(img, 'salt & pepper', 0.2);
subplot(222), imshow(img_noise), title('�ӽ����������ͼ��');

% ���Ӳ�ͬ���͵�����������ע�ͣ�
% % �Ӹ�˹��������ֵΪ0������Ϊ0.06
% img_noise = imnoise(img, 'gaussian', 0, 0.06);
% subplot(222), imshow(img_noise), title('�Ӹ�˹�������ͼ��');

% % ����������,�����ܶ�Ϊ100
% [x, y, z] = size(img);
% r = raylrnd(100, x, y, z);
% img_noise = min( uint8(r + double(img)), 255);
% subplot(222), imshow(img_noise), title('�������������ͼ��');


% �Լ���ͼ���ͨ������
img_noise_r = img_noise( : , : , 1);
img_noise_g = img_noise( : , : , 2);
img_noise_b = img_noise( : , : , 3);


%��ֵ�˲�
%3��3�˲�ģ�����ֵ�˲�
Img_R = medfilt2(img_noise_r);
Img_G = medfilt2(img_noise_g);
Img_B = medfilt2(img_noise_b);

Img = cat(3, uint8(Img_R), uint8(Img_G), uint8(Img_B));
subplot(2,2,3), imshow(Img), title('3x3ģ����ֵ�˲�ͼ��'); 

%��ֵ�˲�
Img_ave_R = filter2(fspecial('average',3),img_noise_r); 
Img_ave_G = filter2(fspecial('average',3),img_noise_g); 
Img_ave_B = filter2(fspecial('average',3),img_noise_b); 

Img_ave = cat(3, uint8(Img_ave_R), uint8(Img_ave_G), uint8(Img_ave_B));
subplot(2,2,4), imshow(Img_ave), title('3x3ģ���ֵ�˲�ͼ��'); 



