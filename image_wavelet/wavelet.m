clear
img = imread('img\cd1.jpg');
X = rgb2gray(img);%真彩变灰度图像

subplot(221),imshow(X,[]),title('原始图像');

% 对图像进行小波分解
[cA1,cH1,cV1,cD1]=dwt2(X,'db1');

dec2d=[cA1,cH1;cV1,cD1];
subplot(222),imshow(dec2d,[]),title('一级小波分解后的图像');

% 对图像进行重构
sX=size(X);
A0=idwt2(cA1,cH1,cV1,cD1,'db1',sX);
subplot(223),imshow(A0,[]),title('重构图像');

% 计算能量占比
E_cA1 = sum(sum( cA1.^2) );
E_cH1 = sum(sum( cH1.^2) );
E_cV1 = sum(sum( cV1.^2) );
E_cD1 = sum(sum( cD1.^2) );
E_X = (E_cA1 + E_cH1 + E_cV1 + E_cD1);

fprintf('子带 cA1 的能量占比：%f\n', E_cA1 / E_X);
fprintf('子带 cH1 的能量占比：%f\n', E_cH1 / E_X);
fprintf('子带 cV1 的能量占比：%f\n', E_cV1 / E_X);
fprintf('子带 cD1 的能量占比：%f\n', E_cD1 / E_X);

% 计算重构误差
diff_X = sum(sum( (double(X) - (A0)).^2 )) / (sX(1) * sX(2));
fprintf('图像的重构误差：%s\n', num2str(diff_X));

% 各子带系数直方图
figure
subplot(221),imhist(uint8(cA1)),title('cA1');
subplot(222),imhist(uint8(cH1)),title('cH1');
subplot(223),imhist(uint8(cV1)),title('cV1');
subplot(224),imhist(uint8(cD1)),title('cD1');

