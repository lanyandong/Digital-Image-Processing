clear
img = imread('img\cd1.jpg');
subplot(321), imshow(img), title('原始图像');
img_gray = rgb2gray(img);
subplot(322), imhist(img_gray), title('原始图像直方图');

hsi_image = rgb2hsi(img);      % 将rgb颜色空间转换为hsi颜色空间
hue = hsi_image(:,:,1);        % 提取色度通道
sat = hsi_image(:,:,2);        % 提取饱和度通道
int = hsi_image(:,:,3);        % 提取明度通道

subplot(323), imshow(hsi_image), title('HSI图像');
hsi_gray = rgb2gray(hsi_image);
subplot(324), imhist(hsi_gray), title('HSI图像直方图');

hint = histeq(int);
hsi=cat(3,hue,sat,hint); % 对I分量进行均衡化
rgb_image = hsi2rgb(hsi);
subplot(325), imshow(rgb_image), title('对HSI的I均衡化后的图像');

hhsi = rgb2gray(rgb_image);
subplot(326),imhist(hhsi), title('重构图像均衡化直方图');

