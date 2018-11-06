clear
img = imread('img\cd1.jpg');
X = rgb2gray(img);%真彩变灰度图像

subplot(221),imshow(X,[]),title('原始图像');

% 对图像进行小波分解
[cA1,cH1,cV1,cD1]=dwt2(X,'db1'); %一级分解
[xcA1,xcH1,xcV1,xcD1]=dwt2(cA1,'db1'); %二级分解

xdec2d=[xcA1,xcH1;xcV1,xcD1];
dec2d=[xdec2d,cH1;cV1,cD1];
subplot(222),imshow(dec2d,[]),title('图像二级小波分解');

% 对图像进行重构
sX=size(X);
scA1=size(cA1);
cA1=idwt2(xcA1,xcH1,xcV1,xcD1,'db1',scA1);
A0=idwt2(cA1,cH1,cV1,cD1,'db1',sX);
subplot(223),imshow(A0,[]),title('重构后的图像');

% 计算能量占比
E_xcA1 = sum(sum( xcA1.^2) );
E_xcH1 = sum(sum( xcH1.^2) );
E_xcV1 = sum(sum( xcV1.^2) );
E_xcD1 = sum(sum( xcD1.^2) );

E_cA1 = (E_xcA1 + E_xcH1 + E_xcV1 + E_xcD1);
E_cH1 = sum(sum( cH1.^2) );
E_cV1 = sum(sum( cV1.^2) );
E_cD1 = sum(sum( cD1.^2) );

E_X = (E_cA1 + E_cH1 + E_cV1 + E_cD1);

fprintf('子带 xcA1 的能量占比：%f\n', E_xcA1 / E_X);
fprintf('子带 xcH1 的能量占比：%f\n', E_xcH1 / E_X);
fprintf('子带 xcV1 的能量占比：%f\n', E_xcV1 / E_X);
fprintf('子带 xcD1 的能量占比：%f\n', E_xcD1 / E_X);

fprintf('子带 cH1 的能量占比：%f\n', E_cH1 / E_X);
fprintf('子带 cV1 的能量占比：%f\n', E_cV1 / E_X);
fprintf('子带 cD1 的能量占比：%f\n', E_cD1 / E_X);

% 计算重构误差
diff_X = sum(sum( (double(X) - (A0)).^2 )) / (sX(1) * sX(2));
fprintf('图像的重构误差：%s\n', num2str(diff_X));


% 各子带系数直方图
figure
subplot(241),imhist(uint8(xcA1)),title('xcA1');
subplot(242),imhist(uint8(xcH1)),title('xcH1');
subplot(243),imhist(uint8(xcV1)),title('xcV1');
subplot(244),imhist(uint8(xcD1)),title('xcD1');

subplot(245),imhist(uint8(cH1)),title('cH1');
subplot(246),imhist(uint8(cV1)),title('cV1');
subplot(247),imhist(uint8(cD1)),title('cD1');

