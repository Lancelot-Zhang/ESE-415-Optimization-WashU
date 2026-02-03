
clc;
clear;

load('least_squares_data.mat')
plot(0:dt:9.99, y_meas_noise,'r.');
xlabel('Time'); 
ylabel('Noisy position measurement');

% Create the time vector
time = 0:dt:9.99;

% Design matrix with a column of time values and a column of ones
X = [time', ones(length(time), 1)];

% Compute the least squares solution, beta=(X^T*X)^(-1)*X^T*y
beta = (X' * X) \ (X' * y_meas_noise');

% Extract the slope (velocity) and intercept from the solution
v = beta(1);
c = beta(2);

% Plot the noisy measurements
figure;
plot(time, y_meas_noise, 'r.', 'DisplayName', 'Noisy measurements');
hold on;

% Plot the best-fit line
y_fit = v * time + c;
plot(time, y_fit, 'b-', 'LineWidth', 2, 'DisplayName', 'Best-approximation line');

% Label the axes and add a legend
xlabel('Time');
ylabel('Position');
legend('show');
title(sprintf('Least Squares with Estimated Velocity = %.4f', v));