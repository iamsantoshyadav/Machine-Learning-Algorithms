% Now we are going to implement logistic regression algorithm here
% whivh is used for classification problem
data=load('ex2data1.txt');
X=data(:,[1 2]);
y=data(:,3);

% Now we are going to visualize the data sets
% 1st we need to know position of X where y is 0 and y  is one for that perticular feature
positive=find(y==1);
negative=find(y==0);
figure ;
plot(X(positive,1),X(positive,2),'k+','LineWidth',2,'MarkerSize',7);
hold on;
plot(X(negative,1),X(negative,2),'ko','MarkerFaceColor','y','MarkerSize',7);
xlabel('X1');
ylabel('X2')
legend('Y=1', 'Y=0');
% Adding ones column to the dataset
m=length(X(:,1));
X=[ones(m,1) X]; 
n=length(X(1,:));
initial_theta=zeros(n,1);
% Now its time to calculate cost function value J which going to be done froom costFunction.m
% from this cost function we are going to take value of grad too

[J grad] = costFunction(initial_theta, X, y);
% Now its time to minimize local minima for prediction so now we are going to use matlab
%inbuilt function for calculate minimum value of theta 
option=optimset('GradObj','on','MaxIter',400);
[theta, cost]=fminunc(@(t)costFunction(t, X, y), initial_theta, option);

% Now we are going to make decission boundry on given data sets
plotDecisionBoundary(theta, X, y);
