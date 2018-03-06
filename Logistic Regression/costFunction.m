% In this fnction we are going to calculate cost and grad
function [J grad] =cosFunction(theta, X, y)

% So now its time to calculate hypothesis function including sigmoid function
m=length(X(:,1)); % nos of training examples
n=length(X(1,:)); % no of feature
z=X*theta;
hypothesis=sigmoid(z); % here we are going to call a sigmoid.m function
cost=(((-y).*log(hypothesis))-((1-y).*log(1-hypothesis)));
J=1/m*sum(cost);

%##########Now we have calculated cost and now trying to calculate grad
sqError = zeros(n,1);
grad=zeros(n,1);
for i=1:3
    sqError(i,1)=sum((hypothesis-y).*X(:,i));
end
grad=1/m*sqError;
