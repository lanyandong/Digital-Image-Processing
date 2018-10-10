%MATLAB编程实现两张图片的切换；
%将切换效果保存gif格式。

function imgchange()
I1=imread('img\cd1.jpg');
I2=imread('img\cd2.jpg');
[x,y,z]=size(I1);%图片大小
Im=I1;
hIm=imshow(Im);
Width=x;
gif = 0;
step=y/10;%设置渐变步长
    %实现图片的渐变切换
    for i=step:step:y
        % 改变图像数据
        Im(1:Width,1:i, : )=I2(1:Width,y-i+1:y, : );
        set(hIm,'CData',Im);%设置image对象CData属性为Im
        drawnow ;%重绘当前图形窗口
        gif = gif + 1;
        %依次输出图片
        print('-dbmp',sprintf('%d',gif) )      
    end
    
for g=1:gif
    %获取当前图片
    A=imread(sprintf('%d.bmp',g));
    [I,map]=rgb2ind(A,256);
    %生成gif，并保存
    if(g==1)
        imwrite(I,map,'movefig.gif','DelayTime',0.1,'LoopCount',Inf)
    else
        imwrite(I,map,'movefig.gif','WriteMode','append','DelayTime',0.1)    
    end
end 
end

