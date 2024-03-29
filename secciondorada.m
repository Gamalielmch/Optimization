
clear
U = @(T) 204165.5/(330-2*T) + 10400/(T-20);
a = 40; %-> lower bound of the design variable
b = 90; %-> upper bound of the design variable
delx = 0.01; %-> x for central difference method
tau=0.381967
epsilon=0.0001
clc
fprintf('     a       b           f(x)\n')
fprintf('----------------------------------\n')
for i= 1:100
    alpha1=a*(1-tau) +b*tau;
    alpha2=a*tau +b*(1-tau);
    fa1=U(alpha1);
    fa2=U(alpha2);
    if fa1>fa2
      a=alpha1;
    else
      b=alpha2;
    endif
    if abs(fa1- fa2)<epsilon
      break
    endif
    fprintf('x* = %7.3f Minimum = %8.3f\n',a,U(a))
endfor
fprintf('----------------------------------\n')
fprintf('x* = %7.3f Minimum = %8.3f\n',a,U(a))
fprintf('Number of function calls = %3d\n',i)


