clear
img = imread('img\cd1.jpg');
X = rgb2gray(img);%��ʱ�Ҷ�ͼ��

subplot(221),imshow(X,[]),title('ԭʼͼ��');

% ��ͼ�����С���ֽ�
[cA1,cH1,cV1,cD1]=dwt2(X,'db1'); %һ���ֽ�
[xcA1,xcH1,xcV1,xcD1]=dwt2(cA1,'db1'); %�����ֽ�
[xxcA1,xxcH1,xxcV1,xxcD1]=dwt2(xcA1,'db1'); %�����ֽ�

xxdec2d=[xxcA1,xxcH1;xxcV1,xxcD1];
xdec2d=[xxdec2d,xcH1;xcV1,xcD1];
dec2d=[xdec2d,cH1;cV1,cD1];
subplot(222),imshow(dec2d,[]),title('ͼ������С���ֽ�');

% ��ͼ������ع�
sX=size(X);
scA1=size(cA1);
sxcA1=size(xcA1);
xcA1=idwt2(xxcA1,xxcH1,xxcV1,xxcD1,'db1',sxcA1);
cA1=idwt2(xcA1,xcH1,xcV1,xcD1,'db1',scA1);
A0=idwt2(cA1,cH1,cV1,cD1,'db1',sX);
subplot(223),imshow(A0,[]),title('�ع����ͼ��');

% �����ع�
z_xxcA1 = xxcA1;
z_xcA1 = xcA1;
z_cA1 = cA1;

z_xxcH1 = zeros(size(xxcH1));
z_xxcV1 = zeros(size(xxcV1));
z_xxcD1 = zeros(size(xxcD1));
z_xcH1 = zeros(size(xcH1));
z_xcV1 = zeros(size(xcV1));
z_xcD1 = zeros(size(xcD1));
z_cH1 = zeros(size(cH1));
z_cV1 = zeros(size(cV1));
z_cD1 = zeros(size(cD1));

z_sX=size(X);
z_scA1=size(z_cA1);
z_sxcA1=size(z_xcA1);
z_xcA1=idwt2(z_xxcA1,z_xxcH1,z_xxcV1,z_xxcD1,'db1',z_sxcA1);
z_cA1=idwt2(z_xcA1,z_xcH1,z_xcV1,z_xcD1,'db1',z_scA1);
z_A0=idwt2(z_cA1,z_cH1,z_cV1,z_cD1,'db1',z_sX);
subplot(224),imshow(z_A0,[]),title('�����ع����ͼ��');

% ��������ռ��
E_xxcA1 = sum(sum( xxcA1.^2) );
E_xxcH1 = sum(sum( xxcH1.^2) );
E_xxcV1 = sum(sum( xxcV1.^2) );
E_xxcD1 = sum(sum( xxcD1.^2) );

E_xcA1 = (E_xxcA1 + E_xxcH1 + E_xxcV1 + E_xxcD1);
E_xcH1 = sum(sum( xcH1.^2) );
E_xcV1 = sum(sum( xcV1.^2) );
E_xcD1 = sum(sum( xcD1.^2) );

E_cA1 = (E_xcA1 + E_xcH1 + E_xcV1 + E_xcD1);
E_cH1 = sum(sum( cH1.^2) );
E_cV1 = sum(sum( cV1.^2) );
E_cD1 = sum(sum( cD1.^2) );

E_X = (E_cA1 + E_cH1 + E_cV1 + E_cD1);

fprintf('�Ӵ� xxcA1 ������ռ�ȣ�%f\n', E_xxcA1 / E_X);
fprintf('�Ӵ� xxcH1 ������ռ�ȣ�%f\n', E_xxcH1 / E_X);
fprintf('�Ӵ� xxcV1 ������ռ�ȣ�%f\n', E_xxcV1 / E_X);
fprintf('�Ӵ� xxcD1 ������ռ�ȣ�%f\n', E_xxcD1 / E_X);

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
subplot(3,4,1),imhist(uint8(xxcA1)),title('xxcA1');
subplot(3,4,2),imhist(uint8(xxcH1)),title('xxcH1');
subplot(3,4,3),imhist(uint8(xxcV1)),title('xxcV1');
subplot(3,4,4),imhist(uint8(xxcD1)),title('xxcD1');

subplot(3,4,5),imhist(uint8(xcH1)),title('xcH1');
subplot(3,4,6),imhist(uint8(xcV1)),title('xcV1');
subplot(3,4,7),imhist(uint8(xcD1)),title('xcD1');

subplot(3,4,9),imhist(uint8(cH1)),title('cH1');
subplot(3,4,10),imhist(uint8(cV1)),title('cV1');
subplot(3,4,11),imhist(uint8(cD1)),title('cD1');

