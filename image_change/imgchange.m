%MATLAB���ʵ������ͼƬ���л���
%���л�Ч������gif��ʽ��

function imgchange()
I1=imread('img\cd1.jpg');
I2=imread('img\cd2.jpg');
[x,y,z]=size(I1);%ͼƬ��С
Im=I1;
hIm=imshow(Im);
Width=x;
gif = 0;
step=y/10;%���ý��䲽��
    %ʵ��ͼƬ�Ľ����л�
    for i=step:step:y
        % �ı�ͼ������
        Im(1:Width,1:i, : )=I2(1:Width,y-i+1:y, : );
        set(hIm,'CData',Im);%����image����CData����ΪIm
        drawnow ;%�ػ浱ǰͼ�δ���
        gif = gif + 1;
        %�������ͼƬ
        print('-dbmp',sprintf('%d',gif) )      
    end
    
for g=1:gif
    %��ȡ��ǰͼƬ
    A=imread(sprintf('%d.bmp',g));
    [I,map]=rgb2ind(A,256);
    %����gif��������
    if(g==1)
        imwrite(I,map,'movefig.gif','DelayTime',0.1,'LoopCount',Inf)
    else
        imwrite(I,map,'movefig.gif','WriteMode','append','DelayTime',0.1)    
    end
end 
end

