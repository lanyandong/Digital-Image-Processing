%实现两幅图像淡入淡出一秒钟视频。
clear
img = imread('img\cd1.jpg');
img2 = imread('img\cd2.jpg');

%判断两张图片大小相同
img_size = size(img);
img2_size = size(img2);
if(img_size == img2_size)
   disp('两张图片大小相同');
else
   [x,y,z] = size(img);
   img2_cover = imresize(img2,[x,y],'nearest'); %将两张图片大小改为一致
   img2 = img2_cover;
end

%对真彩图像区分RGB通道
img_r = img( : , : , 1);
img_g = img( : , : , 2);
img_b = img( : , : , 3);

img2_r = img2( : , : , 1);
img2_g = img2( : , : , 2);
img2_b = img2( : , : , 3);


video = VideoWriter('video.avi'); %创建avi视频对象
video.FrameRate = 24;
open(video);
for alpha=1:-(1/24):0
    Y_r = uint8(img_r * alpha) + uint8(img2_r * (1 - alpha));
    Y_g = uint8(img_g * alpha) + uint8(img2_g * (1 - alpha));
    Y_b = uint8(img_b * alpha) + uint8(img2_b * (1 - alpha));
    Y = cat(3, Y_r, Y_g, Y_b);%将索引图像合并为真彩图像
    writeVideo(video, Y);
    
end
close(video);


