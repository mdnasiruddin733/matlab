function [root,ea,iter]=secant(func,xr,xr_1, es,maxit)
% newtraph: Newton-Raphson root location zeroes
% [root,ea,iter]=newtraph(func,dfunc,xr,es,maxit):
%   uses Newton-Raphson method to find the root of func
% input:
%   func = name of function
%   dfunc = name of derivative of function
%   xr = initial guess 1
%   xr_1 = initial guess 2
%   es = desired relative error (default = 0.0001%)
%   maxit = maximum allowable iterations (default = 50)

% output:
%   root = real root
%   ea = approximate relative error (%)
%   iter = number of iterations
if nargin<3,error('at least 3 input arguments required'),end
if nargin<4|isempty(es),es=0.0001;end
if nargin<5|isempty(maxit),maxit=50;end
iter = 0;
while (1)
  xrold = xr;
  xr = xr - (feval('func',xr)*(xr_1-xr)/(feval('func',xr_1)-feval('func',xr)));
  iter = iter + 1;
  if xr ~= 0, ea = abs((xr - xrold)/xr) * 100; end
  if ea <= es | iter >= maxit, break, end
end
root = xr;