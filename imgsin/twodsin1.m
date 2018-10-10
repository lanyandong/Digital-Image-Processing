function f = twodsin1(A, u0, v0, M, N )
%TWODSIN1 ����f(x,y) = Asin(u0x + v0y) ��ʽ����һ���ϳ�ͼ��
%   �ú���ʹ��������Ƕ�׵�forѭ��
%   ����һ��512 * 512 ���ص�ͼ����ʵ���ͼ��
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

