%��ϤMATLABͼ����ĳ��ú���
%��ϤRGB���Ҷ�ͼ�񣬶�ֵͼ������ͼ���װ����
Img=imread('img\cd1.jpg');%��ͼ�����ͼ��
subplot(221),imshow(Img),title('ԭʼͼ��');

Img_gray = rgb2gray(Img);%��ʱ�Ҷ�ͼ��
subplot(222),imshow(Img_gray ),title('�Ҷ�ͼ��');

Img_2b=im2bw(Img,0.5);%��ʱ��ֵͼ��
subplot(223),imshow(Img_2b),title('��ֵͼ��');

Img_index=rgb2ind(Img,128);%��ʱ�����ͼ��
subplot(224),imshow(Img_index),title('����ɫͼ��'); 



