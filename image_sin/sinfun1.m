function y = sinfun1( M )
%SINFUN1 f(x) = sin(x/100pi)
%   此处显示详细说明
    x = 0:M - 1;
    for k = 1:numel(x)
        y(k) = sin(x(k) / (100 * pi));
    end
end

