clear
clc
syms x 

promptx = 'What are the x-coordinates? ';
xarr = input(promptx)
prompty = 'What are the y-coordinates? ';
yarr = input(prompty)
promptorder = 'Polynomial order = ';
order = input(promptorder);

if order > length(xarr)
    disp("order cannot be more than the number of points, In such case the order equals the number of points -1");
end

A = sym('a',[1 order+1]);

yexp=0;
for i=1:order+1
    yexp=A(i)*(x^(i-1)) + yexp;
end

for i=1:length(xarr)
    exp(i)=(yarr(i)-(subs(yexp,xarr(i))))^2;
end
exptobediff=sum(exp);
for i=1:order+1
    s(i)=diff(exptobediff,A(i));
    c(i,:)=coeffs(s(i));
    c(i,:)=flip(c(i,:));
end
for i=1:order+1
    B(i)=c(i,order+2);
end

for i=1:order+1
    for j=1:order+1
        d(i,j)=c(i,j);
    end
end

B=-1*transpose(B);
sol=linsolve(d,B);

yfit=0;
for i=1:order+1
    yfit=sol(i)*x^(i-1) + yfit;
end

yfit

hold on
plot(xarr,yarr,'*')
fplot(yfit)
xlabel('X')
ylabel('Y')
title('Least Square Error plot')
grid on






    

