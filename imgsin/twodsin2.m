function f = twodsin2(A, u0, v0, M, N )
%TWODSIN2 ����f(x,y) = Asin(u0x + v0y) ��ʽ����һ���ϳ�ͼ��
%   �ú���ʹ����meshgrid��������д��ά���Һ���
%   ����һ��512 * 512 ���ص�ͼ����ʵ���ͼ��
%   f = twodsin2(1, 1/(4 * pi), 1/(4 * pi) , 512, 512);
%   imshow(f, [])
    r = 0 : M - 1;
    c = 0 : N - 1;
    [C, R] = meshgrid(c, r);
    f = A * sin(u0*R + v0*C);
end

