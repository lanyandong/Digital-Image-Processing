clear
img = imread('img\cd1.jpg');
subplot(321), imshow(img), title('ԭʼͼ��');
img_gray = rgb2gray(img);
subplot(322), imhist(img_gray), title('ԭʼͼ��ֱ��ͼ');

hsi_image = rgb2hsi(img);      % ��rgb��ɫ�ռ�ת��Ϊhsi��ɫ�ռ�
hue = hsi_image(:,:,1);        % ��ȡɫ��ͨ��
sat = hsi_image(:,:,2);        % ��ȡ���Ͷ�ͨ��
int = hsi_image(:,:,3);        % ��ȡ����ͨ��

subplot(323), imshow(hsi_image), title('HSIͼ��');
hsi_gray = rgb2gray(hsi_image);
subplot(324), imhist(hsi_gray), title('HSIͼ��ֱ��ͼ');

hint = histeq(int);
hsi=cat(3,hue,sat,hint); % ��I�������о��⻯
rgb_image = hsi2rgb(hsi);
subplot(325), imshow(rgb_image), title('��HSI��I���⻯���ͼ��');

hhsi = rgb2gray(rgb_image);
subplot(326),imhist(hhsi), title('�ع�ͼ����⻯ֱ��ͼ');

