

%Created by: Justyn Knapp
%Created on: 3/29/19
%LU Factorization algorithm

function [L,U,P] = luFactor3(A)
%This funciton computes the LU factorization of any given square
%coefficient matrix, with partial pivoting.
%   This function will use Gauss elimination in order to eliminate a
%   coefficient. By inputing a matrix into A, the lower triangle, upper
%   triangle, and pivot matrix will all be displayed. The dimenstions of A
%   must be a square matrix.

%% Defined the rows and columns of the input matrix, and determined size 
r = 0;
c = 0;
[r,c]=size(A);

%Defined the pivot, lower and upper triangle matrix, and sets the values to 0
L = eye(size(A));
U = A;
P = eye(size(A))
col = 0

%Checks the dimensions of the matrix to determine if it is a square matrix

if r~=c
    error('Enter a matrix that has the same number of rows as columns.');
end

%Defines MAX and pos, so when the max absolute value is found, it will
%store what it is, and what coluumn it is in
MAX = 0;
pos = 0;


%% Calculating U
%This for loop will complete all of the steps to Gauss Elimination
for a = 1:r-1
    
    %This for loop will determine where the highest abs value and what
    %position its in
    for i = a:c
       if MAX < abs(U(i,a))
          MAX = abs(U(i,a));
          pos = i;
       end
    %If the position doesnt equal 1, it will pivot from the found max and pos, and swap with the position of a   
    end
       if pos ~= a
           P([pos a],:) = P([a pos],:);
           U([pos a],:) = U([a pos],:);
   
           if a >= 2
               col = col+1
           L([a pos], col)=L([pos a],col)
           
           end
       end
   
   %Will calculate the coefficient needed so it can be multiplied later
   for j = a:r-1

        if U(a,a)~=0 
            L(j+1,a) = U(j+1,a)/U(a,a);
        end
        
        %Found coefficient from above will be multilied by the row, and
        %subtracted so elimination of a variable can occur
        U(j+1,:) = U(j+1,:)-(L(j+1,a)*U(a,:));
                 
   end
end

%% Redefines the different matrices that are needed at the end.
P = P
U = U
L = L
B = L*U
end
