% This is complete script of Linear regressin to impliment this i have made
% following function
% CostFunction.m
% GradienDescent.m
data = load('ex1data1.txt'); %ex1data1.txt is file of datasets with single feature and one output
x=data(:,1);
y=data(:,2);
m=length(y);
% Now we are going to visulize data here
plot(x,y,'rx');
xlabel('population size in 10,000s');
ylabel('profit in $10,000s');
% Now we are goin to implement cost function
X = [ones(m,1),x];
n=length(X(1,:)); % n is no of features in given datasets
theta = zeros(n,1);
J = CostFunction(X,y,theta);
fprintf('We got the value of J : %f\n',J);

% Now we are going to use Gradient function for get minimal value of theta
 alpha=0.01; % Value of learning rate
 no_iterations=1500;
 theta = GradientDescent(X,y,theta,alpha,no_iterations);
 % Aftere applying gradient descent finaly we got the local minima of cost function
 fprintf('Minimized value of theta is %f \n',theta)
 % Now we are going to plot linear regression line on the plot
 hold on;
 hypothesis = X*theta;
 plot(X(:,2),hypothesis,'-');
 predict1=[1, 5.5204]*theta;
 fprintf('prediction value of 55204 is %f\n',predict1*10000);
 
 
 % Now we are going to visulize our 
 theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);

% initialize J_vals to a matrix of 0's
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Fill out J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];
	  J_vals(i,j) = CostFunction(X, y, t);
    end
end


% Because of the way meshgrids work in the surf command, we need to
% transpose J_vals before calling surf, or else the axes will be flipped
J_vals = J_vals';
% Surface plot
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');

% Contour plot
figure;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
 