clf
x = [-%pi:0.1:%pi];
y1 = sin(x);
plot(x,y1);
y2 = cos(x);
plot(x,y2,'-r');
legend('Seno', 'Cosseno');
