%Ellie Cautilli 
%March 31st 2019
%LU Factorization

function [L,U,P] = luFactor(A)
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
L = zeros(size(A)); % will set up a zeros matrix in the size of A
U = A;      %sets U as A so that manipulations can be made      
len = length(A)
for a = 1:len;
    max = 0; 
    loc = a;
    for test = a:len               %finding the max in the column before pivoting 
     if abs(U(test,a)) > max
         max = abs(U(test,a));
         loc = test;
     end
    end
    %pivot
    if   loc ~= a               
        current = U(a,:);           %switches the position of the U Matrix
        U(a,:) = U(loc,:);
        U(loc,:) = current;
        current = P(a,:);           %switches the position of the P Matrix
        P(a,:) = P(loc,:);
        P(loc,:) = current;
        current = L(a,:);           %switches the position of the L Matrix
        L(a,:) = L(loc,:);
        L(loc,:) = current;
    end
      for belowrow = a:len-1
          if U(belowrow+1,a) ~= 0
              L(belowrow+1,a) = U(belowrow+1,a)/U(a,a);         %creates a ratio that can be used to cancel rows in the matrix
              for cols = 1:len
                  U(belowrow+1, cols) = U(belowrow+1,cols)-(U(a,cols)*L(belowrow+1,a));     %uses the ratio found and multiplies to cancel rows
              end
          end
      end
end
 L = L+eye(size(A))             %will add the diagonal rows of 1 into the L matrix that was not there due to the zeroing in the begining
end


 