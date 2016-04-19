# method 1

w = rnorm(500,0,1)

x <- filter(w, method = "convolution", sides = 1, c(1, -.6)) -.6;

# method 2 more efficient, you can generate ARMA and AR models
x <- arima.sim(model = list(ma = -.6), n = 500) - .6

xacf <- acf(x, lag.max = 20, na.action = na.pass) # if you use 2nd method you don't need this part

xacf_theo <- ARMAacf(ma = -.6, lag = 20);
lines(0:20, xacf_theo, col = "red", type = "h", lty = 2, lwd = 2)
xacf
