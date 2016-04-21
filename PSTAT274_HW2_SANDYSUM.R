cs = 2*cos(2*pi*1:500/50 + .6*pi);  w = rnorm(500,0,1)
x = cs + w

acf(x, 100, main="signal-plus-noise model")
