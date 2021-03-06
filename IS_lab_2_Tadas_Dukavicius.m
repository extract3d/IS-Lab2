% generate input parameters
x = [0.1];
for k=1:18;
    x(k+1) = x(k) + 0.0475;
end
x(20) = 1;

d = [];

% learning rate
n = 0.1;

% generate desired output
for i=1:20
    d(i) = (1 + 0.6*sin(2*pi*x(i)/0.7)+0.3*sin(2*pi*x(i)))/2;
end

% generate random initial values of w and b
w11_1 = randn(1);
w21_1 = randn(1);
w31_1 = randn(1);
w41_1 = randn(1);
w51_1 = randn(1);
w61_1 = randn(1);
w11_2 = randn(1);
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

for l=1:100000
for j=1:length(x)
% calculate weighted sum with randomly generated parameters for the first
% layer
v1_1 = x(j)*w11_1+b1_1;
v2_1 = x(j)*w21_1+b2_1;
v3_1 = x(j)*w31_1+b3_1;
v4_1 = x(j)*w41_1+b4_1;
v5_1 = x(j)*w51_1+b5_1;
v6_1 = x(j)*w61_1+b6_1;

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
e = d(j) - y1_2;

% calculate cost function
C = 1/2*(e^2);


        % update weight parameters for hidden layer
        w11_1 = w11_1 + n*y1_1*(1-y1_1)*(e*w11_2)*x(j);
        w21_1 = w21_1 + n*y2_1*(1-y2_1)*(e*w12_2)*x(j);
        w31_1 = w31_1 + n*y3_1*(1-y3_1)*(e*w13_2)*x(j);
        w41_1 = w41_1 + n*y4_1*(1-y4_1)*(e*w14_2)*x(j);
        w51_1 = w51_1 + n*y5_1*(1-y5_1)*(e*w15_2)*x(j);
        w61_1 = w61_1 + n*y6_1*(1-y6_1)*(e*w16_2)*x(j);
        b1_1 = b1_1 + n*y1_1*(1-y1_1)*(e*w11_2)*1;
        b2_1 = b2_1 + n*y2_1*(1-y2_1)*(e*w12_2)*1;
        b3_1 = b3_1 + n*y3_1*(1-y3_1)*(e*w13_2)*1;
        b4_1 = b4_1 + n*y4_1*(1-y4_1)*(e*w14_2)*1;
        b5_1 = b5_1 + n*y5_1*(1-y5_1)*(e*w15_2)*1;
        b6_1 = b6_1 + n*y6_1*(1-y6_1)*(e*w16_2)*1;

        % update weight parameters for output layer
        w11_2 = w11_2 + n*e*y1_1;
        w12_2 = w12_2 + n*e*y2_1;
        w13_2 = w13_2 + n*e*y3_1;
        w14_2 = w14_2 + n*e*y4_1;
        w15_2 = w15_2 + n*e*y5_1;
        w16_2 = w16_2 + n*e*y6_1;
        b1_2 = b1_2 + n*e*1;
end
end
y = [];
for m=1:length(x)
    v1_1 = x(m)*w11_1+b1_1;
    v2_1 = x(m)*w21_1+b2_1;
    v3_1 = x(m)*w31_1+b3_1;
    v4_1 = x(m)*w41_1+b4_1;
    v5_1 = x(m)*w51_1+b5_1;
    v6_1 = x(m)*w61_1+b6_1;

    % calculate current output of the perceptron using sigmoidal activation
    % function
    y1_1 = 1/(1+exp(-v1_1));
    y2_1 = 1/(1+exp(-v2_1));
    y3_1 = 1/(1+exp(-v3_1));
    y4_1 = 1/(1+exp(-v4_1));
    y5_1 = 1/(1+exp(-v5_1));
    y6_1 = 1/(1+exp(-v6_1));

    % calculate weighted sum for the second layer
    v = y1_1*w11_2 + y2_1*w12_2 + y3_1*w13_2 + y4_1*w14_2 + y5_1*w15_2 + y6_1*w16_2 + b1_2;

    % calculate linear output
    y(m) = v;
   
end    

plot(x, d, 'kx', x, y, 'rx');