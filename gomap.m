function gomap()
close all
m=19;
n=19;
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
end