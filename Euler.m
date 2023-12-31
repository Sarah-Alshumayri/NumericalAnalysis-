% Define the differential equation: y' = e^(-2x)
dydx = @(x, y) exp(-2*x);

% Set the initial conditions
x0 = 0;         % initial value of x
y0 = -0.5;      % initial value of y

% Set the step size
h = 0.5;        % step size

% Set the range of x
x_start = 0;    % starting value of x
x_end = 3;      % ending value of x

% Calculate the number of iterations
num_iterations = ceil((x_end - x_start) / h);

% Initialize arrays to store x, y, and error values
x_values = zeros(num_iterations + 1, 1);
y_values = zeros(num_iterations + 1, 1);
error_values = zeros(num_iterations + 1, 1);

% Set initial values
x_values(1) = x0;
y_values(1) = y0;

% Perform Euler's method iteration
for i = 1:num_iterations
    x = x_values(i);
    y = y_values(i);
    
    % Calculate the slope at the current point
    slope = dydx(x, y);
    
    % Calculate the new values of x and y using Euler's method
    x_new = x + h;
    y_new = y + h * slope;
    
    % Store the new values in the arrays
    x_values(i+1) = x_new;
    y_values(i+1) = y_new;
    
    % Calculate the error at the current point
    exact_solution = exp(-2 * x_new);
    error_values(i+1) = abs(y_new - exact_solution);
end

% Create a table with x, y, and error values
results = table(x_values, y_values, error_values, 'VariableNames', {'x', 'y', 'error'});
disp(results);

% Plot the results
plot(x_values, y_values);
xlabel('x');
ylabel('y');
title("Euler's method solution for y' = e^(-2x)");
