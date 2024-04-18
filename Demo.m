%% ================================================================
% This is the demo code for 
% A novel minimization framework of tensor tubal rank and its multi-dimensional image completion application
% Jin-Liang Xiao, Ting-Zhu Huang, Liang-Jian Deng,and Hong-Xia Dou, 
% Inverse Problems and Imaging
% Contact email: jinliang_xiao@163.com
%% ================================================================
% If you use this code, please cite the following paper:
% @article{xiao2024ipi,
% title = {A novel $ \ell_{0} $ minimization framework of tensor tubal rank and its multi-dimensional image completion application},
% author = {Xiao, Jin-Liang and Huang, Ting-Zhu and Deng, Liang-Jian and Dou, Hong-Xia},
% journal = {Inverse Problems and Imaging},
% pages = {},
% year = {2024},
% issn = {1930-8337},
% doi = {10.3934/ipi.2024018},
% }

% =========================================================================
%% parameters adjustment scope
% Please adjust the following parameters for better results
% Please adjust mu_1 at [1e-6,1e-2]
% Please adjust alpha at [1e-4,1e-1]
% Please adjust beta at [1e1,1e4]
% Please adjust rho at [1,1.4]
% Please adjust mu_2 at [1,1e4]
% Please adjust r at [10,n3]
%%
clear;clc
close all;
addpath(genpath(pwd));
load 'Toy.mat'

X(X<0) = 0;
if max(X(:))>1
    X = X/max(X(:));
end
[n1,n2,n3] = size(X);
DataName='Toy';


p = 0.1; % The ratio of observed entries
omega = find(rand(n1*n2*n3,1)<p);
M = zeros(n1,n2,n3);
M(omega) = X(omega);


enList=[];
i=1;
%% Parameter
opts.mu_1=1e-04;
opts.alpha=1e-02;
opts.beta=1000;
opts.rho=1.1;   
opts.mu_2=10;
opts.r=20;
%%
tic;
PRO = im_Cor_admm(M,omega,opts);
time(i)=toc;

PRO = max(PRO,0);
PRO = min(PRO,1);
ergas(i)=ErrRelGlobAdimSyn(X.* 255, PRO.*255);
[psnr_1, ~,~, sam_1, ~, ssim_1, ~, ~] = quality_assessment(X.* 255, PRO.*255, 0, 1.0/4);
psnr(i)=psnr_1; ssim(i)=ssim_1;
sam(i)=sam_1;
enList = [enList,i];



%% Show result
fprintf('Data: % 2s ||SR : %5.2f   \n',DataName, p);
fprintf('================== Result =====================\n');
fprintf(' %8.8s    %5.4s    %5.4s    %5.4s  %5.7s  %5.4s       \n','method','PSNR', 'SSIM', ' SAM', '  ERGAS', 'TIME');
for i = 1:length(enList)
    fprintf(' %8.8s    %5.3f    %5.3f    %5.3f   %5.3f   %5.3f     \n',...
        'Proposed',psnr(enList(i)), ssim(enList(i)),sam(enList(i)),ergas(enList(i)), time(enList(i)));
end
fprintf('================== Result =====================\n');

