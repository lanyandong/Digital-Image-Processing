clear
img = imread('img\cd1.jpg');
X = rgb2gray(img);%��ʱ�Ҷ�ͼ��

subplot(221),imshow(X,[]),title('ԭʼͼ��');

% ��ͼ�����С���ֽ�
[cA1,cH1,cV1,cD1]=dwt2(X,'db1'); %һ���ֽ�
[xcA1,xcH1,xcV1,xcD1]=dwt2(cA1,'db1'); %�����ֽ�

xdec2d=[xcA1,xcH1;xcV1,xcD1];
dec2d=[xdec2d,cH1;cV1,cD1];
subplot(222),imshow(dec2d,[]),title('ͼ�����С���ֽ�');

% ��ͼ������ع�
sX=size(X);
scA1=size(cA1);
cA1=idwt2(xcA1,xcH1,xcV1,xcD1,'db1',scA1);
A0=idwt2(cA1,cH1,cV1,cD1,'db1',sX);
subplot(223),imshow(A0,[]),title('�ع����ͼ��');

% ��������ռ��
E_xcA1 = sum(sum( xcA1.^2) );
E_xcH1 = sum(sum( xcH1.^2) );
E_xcV1 = sum(sum( xcV1.^2) );
E_xcD1 = sum(sum( xcD1.^2) );

E_cA1 = (E_xcA1 + E_xcH1 + E_xcV1 + E_xcD1);
E_cH1 = sum(sum( cH1.^2) );
E_cV1 = sum(sum( cV1.^2) );
E_cD1 = sum(sum( cD1.^2) );

E_X = (E_cA1 + E_cH1 + E_cV1 + E_cD1);

fprintf('�Ӵ� xcA1 ������ռ�ȣ�%f\n', E_xcA1 / E_X);
fprintf('�Ӵ� xcH1 ������ռ�ȣ�%f\n', E_xcH1 / E_X);
fprintf('�Ӵ� xcV1 ������ռ�ȣ�%f\n', E_xcV1 / E_X);
fprintf('�Ӵ� xcD1 ������ռ�ȣ�%f\n', E_xcD1 / E_X);

fprintf('�Ӵ� cH1 ������ռ�ȣ�%f\n', E_cH1 / E_X);
fprintf('�Ӵ� cV1 ������ռ�ȣ�%f\n', E_cV1 / E_X);
fprintf('�Ӵ� cD1 ������ռ�ȣ�%f\n', E_cD1 / E_X);

% �����ع����
diff_X = sum(sum( (double(X) - (A0)).^2 )) / (sX(1) * sX(2));
fprintf('ͼ����ع���%s\n', num2str(diff_X));


% ���Ӵ�ϵ��ֱ��ͼ
figure
subplot(241),imhist(uint8(xcA1)),title('xcA1');
subplot(242),imhist(uint8(xcH1)),title('xcH1');
subplot(243),imhist(uint8(xcV1)),title('xcV1');
subplot(244),imhist(uint8(xcD1)),title('xcD1');

subplot(245),imhist(uint8(cH1)),title('cH1');
subplot(246),imhist(uint8(cV1)),title('cV1');
subplot(247),imhist(uint8(cD1)),title('cD1');

