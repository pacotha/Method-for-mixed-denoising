clc; clear all;
close all;

imnam='01';
x = imread(imnam,'png');
x=double(x);
padNum=10;
mn=0.9;
mx=120;
sigma=10;

eta=1;
s=0.9;
alfa2=8;
alfa1=1.5*alfa2;
gam=0.9;
beta=0.6.*gam;
lambda=0.4.*gam;
[I0, im]= poisson_count(x, mn, mx );

noise = randn(size(I0));% 
noise = noise/std(noise(:));
I0 = I0+sigma*noise;

imshow(I0,[]);

f0=I0;
f0=double(f0);
theta=1.2;
tic,
u=TGV_nonconvex(f0,1,alfa1,alfa2,beta,lambda,theta,eta,s);
toc
figure; imagesc(u); colormap(gray); axis off; axis equal;
