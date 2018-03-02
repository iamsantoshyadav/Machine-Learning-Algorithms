%Computefunction is function for calculting the vale of J 
function J = CostFunction(X,y,theta)
m = length(y); % Number of training examples
J=0;
hypothesis = X*theta;
sqError = (hypothesis-y).^2;
J = 1/(2*m)*sum(sqError);
end