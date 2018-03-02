% This function is for Gradient descent from which we can find local minima
% of cost function these valu and rate of learning is responsible for good
% prediction
function [theta, J_history] = GradientDescent(X,y,theta,alpha,no_iterations)
m = length(y);
J_history=zeros(m,1);
 % Now we are going to iterate gradient function to calculate value of
 % theta
 for iter = 1:no_iterations
     hypothesis = X*theta;
     sqError = (hypothesis-y);
     theta(1)=theta(1)-alpha*1/m*sum(sqError.*X(:,1));
     theta(2)=theta(2)-alpha*1/m*sum(sqError.*X(:,2));
     
     J_history(iter)=CostFunction(X,y,theta);
 end
end