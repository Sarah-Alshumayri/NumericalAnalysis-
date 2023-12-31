% Taylor Method for solving an IVP

% Set the initial conditions
x0 = 0;  % Initial x
y0 = 0;  % Initial value of y

% Set the interval of integration
x_start = 0;    % Start x
x_end = 1;      % End x

% Set the step size
h = 0.1;  % Step size

% Calculate the number of steps
N = ceil((x_end - x_start) / h);

% Initialize arrays to store the results
x = zeros(N+1, 1);
y = zeros(N+1, 1);
error = zeros(N+1, 1);

% Set the initial values
x(1) = x0;
y(1) = y0;

% Define the function f(x, y) in the differential equation dy/dx = f(x, y)
% Modify this function according to your specific problem
f = @(x, y) x^2 + y;

% Define the true solution for comparison (if available)
% Modify this function according to the true solution of your problem
trueSol = @(x) exp(x) - x^2 - 2 * x - 2;

% Perform the Taylor method
for i = 1:N
    x(i+1) = x(i) + h;
    y(i+1) = y(i) + h * f(x(i), y(i)) + (h^2) / 2 * (f(x(i), y(i)) + 2 * (x(i)^2 + y(i)));
    
    % Calculate the error compared to the true solution (if available)
    error(i+1) = abs(trueSol(x(i+1)) - y(i+1));
end

% Create a table to store the results
results = table(x, y, error, 'VariableNames', {'x', 'y', 'error'});

% Display the table
disp(results);

% Plot the results
figure;
subplot(2, 1, 1);
plot(x, y, 'o-', 'LineWidth', 2);
xlabel('x');
ylabel('y');
title('Taylor Method Solution');

subplot(2, 1, 2);
plot(x, error, 'o-', 'LineWidth', 2);
xlabel('x');
ylabel('Error');
title('Error in Taylor Method Solution');