
function [L,U,P] = luFactor4(A)
% LU Factorization Algorithm
%   To split up the given matrix [A] into its two part [L], the lower
%   triangluar matrix, and [U], the upper triangluar matrix.
m = 0;          %orginially sets the matrix to be a 0 by 0 until the A is input
n = 0;
[m,n] = size(A);    %will break A into the size of n and m 
if n~=m
    error ('Your input must be a square matrix')    %will test to see if your rows and collums are equal, if not it will throw an error
end
P = eye(size(A)); % will set up an identity matrix in the size of A
L = eye(size(A)); % will set up an identity matrix in the size of A
U = A;      %sets U as A so that manipulations can be made
max= 0;        %defines vairables 'maxiumum' and 'location'
loc = 0;
coll = 0;
for a = 1:m-1
    for i = a:n     %will search through columns 'first' through n to determine the max number
        if max < abs(U(i,a))
            max = abs(U(i,a));      
            loc= i;
        end
    end
    if loc ~= a
        P([loc a],:) = P([a loc],:);
        U([loc a],:) = U([a loc],:);
        if a >= 2 
            coll = coll +1;
            L([a loc],coll) = L([loc a],coll);
        end 
    end
for j = a:m-1
    if U(a,a) ~= 0
         L(j+1,a) = U(j+1,a)/U(a,a);
    end
    U(j+1,:) = U(j+1,:) -L(j+1,a)*U(a,:);
end      
end
A = A
P = P
L = L
U = U




