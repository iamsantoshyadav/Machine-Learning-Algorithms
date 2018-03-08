% This scripts is main script for Linera regresion problem with multiple variable
% First we are going to Load tha data from ex1data2.txt file
data=load('ex1data2.txt');
X=[data(:,1),data(:,2)];
plot(X(:,1),X(:,2),'rx')