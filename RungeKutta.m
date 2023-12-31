% Runge-Kutta Method for solving an initial value problem (IVP)

% Define the differential equation dy/dx = f(x, y)
f = @(x, y) -2*x*y;

% Define the initial condition (x0, y0)
x0 = 0;
y0 = 1;

% Define the step size and number of steps
h = 0.1;  % step size
N = 10;   % number of steps

% Initialize arrays to store the values
x = zeros(N+1, 1);
y = zeros(N+1, 1);
fx = zeros(N+1, 1);

% Set initial values
x(1) = x0;
y(1) = y0;
fx(1) = f(x0, y0);

% Perform Runge-Kutta method
for i = 1:N
    x(i+1) = x(i) + h;  % increment x by h
    
    k1 = h*f(x(i), y(i));
    k2 = h*f(x(i) + h/2, y(i) + k1/2);
    k3 = h*f(x(i) + h/2, y(i) + k2/2);
    k4 = h*f(x(i) + h, y(i) + k3);
    
    y(i+1) = y(i) + (k1 + 2*k2 + 2*k3 + k4)/6;  % increment y using weighted average
    fx(i+1) = f(x(i+1), y(i+1));  % calculate f(x) at each step
end

% Display table with x, y, and f(x) values
table_data = [x, y, fx];
disp('    x      |   y    |   f(x)');
disp('-----------------------------');
disp(table_data);

% Plot the solution
plot(x, y, '-o');
xlabel('x');
ylabel('y');
title('Runge-Kutta Method Solution');
