clear
img = imread('img\cd1.jpg');
X = rgb2gray(img);%��ʱ�Ҷ�ͼ��

subplot(221),imshow(X,[]),title('ԭʼͼ��');

% ��ͼ�����С���ֽ�
[cA1,cH1,cV1,cD1]=dwt2(X,'db1');

dec2d=[cA1,cH1;cV1,cD1];
subplot(222),imshow(dec2d,[]),title('һ��С���ֽ���ͼ��');

% ��ͼ������ع�
sX=size(X);
A0=idwt2(cA1,cH1,cV1,cD1,'db1',sX);
subplot(223),imshow(A0,[]),title('�ع�ͼ��');

% ��������ռ��
E_cA1 = sum(sum( cA1.^2) );
E_cH1 = sum(sum( cH1.^2) );
E_cV1 = sum(sum( cV1.^2) );
E_cD1 = sum(sum( cD1.^2) );
E_X = (E_cA1 + E_cH1 + E_cV1 + E_cD1);

fprintf('�Ӵ� cA1 ������ռ�ȣ�%f\n', E_cA1 / E_X);
fprintf('�Ӵ� cH1 ������ռ�ȣ�%f\n', E_cH1 / E_X);
fprintf('�Ӵ� cV1 ������ռ�ȣ�%f\n', E_cV1 / E_X);
fprintf('�Ӵ� cD1 ������ռ�ȣ�%f\n', E_cD1 / E_X);

% �����ع����
diff_X = sum(sum( (double(X) - (A0)).^2 )) / (sX(1) * sX(2));
fprintf('ͼ����ع���%s\n', num2str(diff_X));

% ���Ӵ�ϵ��ֱ��ͼ
figure
subplot(221),imhist(uint8(cA1)),title('cA1');
subplot(222),imhist(uint8(cH1)),title('cH1');
subplot(223),imhist(uint8(cV1)),title('cV1');
subplot(224),imhist(uint8(cD1)),title('cD1');

