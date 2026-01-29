%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%棋盘构造
function [A]=gomap2();
close all
m=27;n=27;
markersize=floor(75-(max([m n])-13)*5/2);
rng('default');
A=randn(m,n);
threshold=1.0;
A(abs(A)<=threshold)=1;
A(abs(A)>threshold)=0;
fig1=figure('color',[1 1 1],'position',[600,100,500*1.5,416*1.5]);
hold on
spy(A,'k',markersize);
axis([1 n 1 m]);
xticks([1:n]);
yticks([1:m]);
ax = gca;
ax.GridColor = [0 .5 .5];
ax.GridLineStyle = '-';
ax.GridAlpha = 0.5;
ax.Layer = 'top';
grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%解题过程
B=ones(m);
C=-A+B;
L=bwlabel(C,4);
a=zeros(1,m*n);
for k=1:m*n
    a(k)=length(find(L==k));
end
D=tabulate(a);
D(1,:)=[];
D(:,3)=[]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%第二问
D1=fliplr(D(:,1)')';
D2=fliplr(D(:,2)')';
b=D1(5,1);
c=D2(5,1);
[row_1,col_1]=find(a==b);
for i=1:c
[row,col]=find(L==col_1(i));
    for j=1:b
        A(row(j),col(j))=2;
    end
end
spy(A==2,'r',markersize)
end