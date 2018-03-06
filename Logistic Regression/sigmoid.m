% In this function we are going to implimenet a sigmoid function for calculate hypothesis
function hypothesis = sigmoid(z);
hypothesis=1./(1+exp(-z));