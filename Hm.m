clear;close all; clc

%part1：汉明码编码

%输入一个二进制原码
code = input('Input the original binary code:\n','s');
%汉明码编码
Hmcode = HmEncode(code)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5


%part2：汉明码纠错

% %输入一个二进制汉明码
% code = input('Input the hamming binary code:\n','s');
% %汉明码检验与纠错
% Hmcode = HmCorrection(code);
