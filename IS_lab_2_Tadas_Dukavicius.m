x = rand(20, 1);

d = [];

for i=1:20
    d(i) = (1 + 0.6 * sin(2*pi*x(i)/0.7))+0.3*sin(2*pi*x(i))/2;
end

% generate random initial values of w and b

w11_1 = rand(1);
w21_1 = randn(1);
w31_1 = randn(1);
w41_1 = randn(1);
w51_1 = randn(1);
w61_1 = randn(1);
w11_2 = rand(1);
w12_2 = randn(1);
w13_2 = randn(1);
w14_2 = randn(1);
w15_2 = randn(1);
w16_2 = randn(1);
b1_1 = randn(1);
b2_1 = randn(1);
b3_1 = randn(1);
b4_1 = randn(1);
b5_1 = randn(1);
b6_1 = randn(1);
b1_2 = randn(1);

% calculate weighted sum with randomly generated parameters for the first
% layer

v1_1 = x(1)*w11_1+b1_1;
v2_1 = x(1)*w21_1+b2_1;
v3_1 = x(1)*w31_1+b3_1;
v4_1 = x(1)*w41_1+b4_1;
v5_1 = x(1)*w51_1+b5_1;
v6_1 = x(1)*w61_1+b6_1;

% calculate current output of the perceptron using sigmoidal activation
% function

y1_1 = 1/(1+exp(-v1_1));
y2_1 = 1/(1+exp(-v2_1));
y3_1 = 1/(1+exp(-v3_1));
y4_1 = 1/(1+exp(-v4_1));
y5_1 = 1/(1+exp(-v5_1));
y6_1 = 1/(1+exp(-v6_1));

% calculate weighted sum for the second layer

v1_2 = y1_1*w11_2 + y2_1*w12_2 + y3_1*w13_2 + y4_1*w14_2 + y5_1*w15_2 + y6_1*w16_2 + b1_2;

% calculate linear output

y1_2 = v1_2;

% calculate error

e1 = d(1) - y1_2;

% calculate cost function

C = 1/2*(e1^2);