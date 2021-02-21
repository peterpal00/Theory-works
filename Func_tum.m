function dxdt = Func_tum(t,x,a,b,bk,c,n,Kb,ED50,w, u, tGrid)
u = interp1(tGrid,u,t);

dxdt = zeros(3,1);

dxdt(1) = (a - n) * x(1) - b*((x(1) * x(3))/(ED50 + x(3)));                 % time func. of tumour vol.
dxdt(2) = n * x(1) + b*((x(1) * x(3))/(ED50 + x(3))) - w * x(2);             % time func. of the dead part of the tumour volume
dxdt(3) = -c*(x(3)/(Kb + x(3))) - bk*((x(1) * x(3))/(ED50 + x(3))) + u;      % time func. of the drug level

end

