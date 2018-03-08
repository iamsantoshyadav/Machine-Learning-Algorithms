function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
data1 = load('ex2data2.txt');
m = length(y); % number of training examples
n=length(theta);

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
sqError = zeros(size(theta));
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
z=X*theta;
theta_sqSum=(sum(theta.^2)-theta(1).^2);
reg=lambda/(2*m)*theta_sqSum;
hypothesis=sigmoid(z);
cost=((-y.*log(hypothesis))-(1-y).*log(1-hypothesis));
J=1/m*sum(cost)+reg;

% Now here we are going to impliment gradient
sqError(1,1)=sum((hypothesis-y).*X(:,1));
grad(1,1)=(1/m*sqError(1,1));
% From here we are going to use gradent for regularization values
for i=2:n
    sqError(i,1)=sum((hypothesis-y).*X(:,i));
    grad(i,1)=((1/m*sqError(i,1))+lambda/m*theta(i));
end




% =============================================================

end
