data=load('ex1data1.txt');
x=data(:,1);
y=data(:,2);
figure;
plot(x,y,'rx');
theta=zeros(2,1);
m=length(x);
X=[ones(m,1),x];
%now we are going to compute cost function J
J=0;
predictions=X*theta;
sqError=(predictions-y).^2;
J=1/(2*m)*sum(sqError);
%now we are going to impliment gradient discent function for minimize theta
iteration=1500;
alpha=0.01;
for itr =1:iteration
    predictions=X*theta;
    sqError=(predictions-y);
    sqError1=(predictions-y).^2;
    J=1/(2*m)*sum(sqError1)
    theta(1)=theta(1)-alpha*1/m*sum(sqError.*X(:,1));
    theta(2)=theta(2)-alpha*1/m*sum(sqError.*X(:,2));
    
    
end
fprintf('>>> %f',theta);
prediction=X*theta;
hold on;
plot(x,prediction)