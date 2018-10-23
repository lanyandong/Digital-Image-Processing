function f = twodsin1(A, u0, v0, M, N )
%TWODSIN1 基于f(x,y) = Asin(u0x + v0y) 公式创建一副合成图像
%   该函数使用了两个嵌套的for循环
%   创建一副512 * 512 像素的图像并现实结果图像
%   f = twodsin1(1, 1/(4 * pi), 1/(4 * pi) , 512, 512);
%   imshow(f, [])

    f = zeros(M, N);
    for c = 1 : N
        v0y = v0 * (c - 1);
        for r = 1 : M
            u0x = u0 * (r -1);
            f(r, c) = A * sin(u0x + v0y);
        end
    end
end

