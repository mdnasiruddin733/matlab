
function [root,ea,iter]=secant(func,xl,xu,es)
if nargin<3
    error('at least 3 input arguments required')
end
if nargin<4||isempty(es),es=0.0001;end
maxit=4; 
iter=0;
xr=xl;
ea=100;
while(1)
    xrold=xr;
    
    xr=xu-((feval('func',xu))*(xl-xu))/(feval('func',xl)-feval('func',xu));
    xl=xu;
    xu=xr;
    
    iter=iter+1;
    if xr~=0, ea=abs((xr-xrold)/xr)*100;end
    if ea<=es||iter>=maxit,break,end
end
root=xr;