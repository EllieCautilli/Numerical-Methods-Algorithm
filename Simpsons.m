% Ellie Cautilli
% Simpsons 1/3 
% Apr 18th 2019
function [I] = Simpsons(x,y)
spacing = diff(x);                              %will create an array with the spacing between each number
if range(spacing) ~= 0                          %checks the range of the array, should be zero because all of the numbers should be the same thus having an evenly spaced original array
    error('Array is not evenly spaced for x')       %throws an error if your array is not evenly spaced
end
if length(x) ~= length(y)
    error('x and y do not have the same length')    %throws an error if your two arrays are not the same length 
end
if nargin < 2
    error('not enough inputs')
end
if mod(length(x),2) == 1
    warning('Even number of points found. Trapezoid rule will be used')      %just warns the user that the trap rule will be used
    iseven = 0;
else
    iseven = 1;
end

h = spacing(1);
if iseven == 0
    I = y(1);
    for odd = 2:2:length(y)-1
        I = I + y(odd)*4;       %the part of the 1/3 rule that sums the odd numbers and multiplies it by 4
    end
    for even = 3:2:length(y)-1
        I = I + y(even)*2;      %the part of the 1/3 rule that sums the even numbers and multiplies it by 2
    end
    I = I + y(length(y));
    I = I*(h/3);
else
    I = y(1)+y(length(y));
    for odd = 2:2:length(y)-2
        I = I + y(odd)*4;       %the part of the 1/3 rule that sums the odd numbers and multiplies it by 4
    end
    for even = 3:2:length(y)-2
        I = I + y(even)*2;      %the part of the 1/3 rule that sums the even numbers and multiplies it by 2
    end
    I = I*(h/3);                %mulitplies the current integral by (h/3) like the formula says
    I = I + (h/2)*(y(length(y))+y(length(y)-1));  %adds in the rest of the intergral to come to a correct answer
end
end