function f = twodsin2(A, u0, v0, M, N )
%TWODSIN2 基于f(x,y) = Asin(u0x + v0y) 公式创建一副合成图像
%   该函数使用了meshgrid函数来重写二维正弦函数
%   创建一副512 * 512 像素的图像并现实结果图像
%   f = twodsin2(1, 1/(4 * pi), 1/(4 * pi) , 512, 512);
%   imshow(f, [])
    r = 0 : M - 1;
    c = 0 : N - 1;
    [C, R] = meshgrid(c, r);
    f = A * sin(u0*R + v0*C);
end

