clear

% a = 10^-1.18;        % tumour growth rate
% b = 10^-1.79;        % drug effect rate
% bk = 10^-14.3;       % idk
% c = 10^-1.36;        % drug washout rate
% n = 10^-1.94;        % tumour necrosis rate
% Kb = 10^-1.02;       % Michaelis - Menten const. of drug
% ED50 = 10^-9.24;     % ED50 of the drug
% w = 10^-1.08;        % death cells washout rate
% x0 = [10^1.94,       % living tumour vol.
%     0,               % dead tuomur vol
%     0];              % drug concentration

a = 0.306;        % tumour growth rate
b = 0.166;        % drug effect rate
bk = 6.12;       % idk
c = 0.257;        % drug washout rate
n = 0.144;        % tumour necrosis rate
Kb = 0.36;       % Michaelis - Menten const. of drug
ED50 = 9.71;     % ED50 of the drug
w = 0.34;        % death cells washout rate
x0 = [10,       % living tumour vol.
    0,               % dead tuomur vol
    0];              % drug concentration


tStart = 0;
tRes = 0.2;
tEnd = 5;
tGrid = tStart:tRes:tEnd;


u = ones(length(tGrid),1) * 1;

%dir = dirac(100)

%u(150) = 80


[t,x] = ode45(@(t,x)Func_tum(t,x,a,b,bk,c,n,Kb,ED50,w, u, tGrid), tGrid, x0);




l = plot(t,x(:,1))
hold on
d = plot(t,x(:,2))
dr = plot(t,x(:,3))
legend([l,d,dr], 'Live tumour', 'Dead tumour', 'Drog conc.');
hold off