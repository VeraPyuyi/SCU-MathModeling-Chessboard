%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%棋盘构造
function gomap()
close all
m=19;n=19;
markersize=floor(75-(max([m n])-13)*5/2);
rng('default');
A=randn(m,n);
threshold=1.0;
A(abs(A)<=threshold)=1;
A(abs(A)>threshold)=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%解答过程
B=ones(m);
C=-A+B;
L=bwlabel(C,4);
a=zeros(1,m*n);
for k=1:m*n
    a(k)=length(find(L==k))
end
D=tabulate(a);
D(1,:)=[]
D(:,3)=[]
D1=fliplr(D(:,1)')';
D2=fliplr(D(:,2)')';
E=size(D)
Mark=linspace(1,E(1),E(1))'
G=table(Mark,D1,D2)
writetable(G)
end