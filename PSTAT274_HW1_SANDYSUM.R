
####################################
############  PSTAT 274  ###########
# Sandy Sum Homework 1 Spring 2016 #
####################################

# Q3

# A)
w = rnorm(100,0,1) # creating series of normally iid white noise

x1 = filter(w, filter=c(0, -.9), method="recursive") # AR process, apply recursive filter with f1 = 0, f2 = .9
v1 = filter(x1,rep(1/4, 4), sides = 1, method = "convolution") # smoothing with MA, side = 1 as filter coefs only depend on past values, if sides = 2 #they are centred around lag 0.
plot.ts(x1, main="Autoregression")
lines(v1, lty = "dashed")
points(x1, pch = 19, col = 'red', cex = 1)

# B)
x2 = 2*cos(2*pi*(1:100)/4)
v2 = filter(x2,rep(1/4, 4), sides = 1, method = "convolution")
plot.ts(x2, main="Cosine TS")
lines(v2, lty = "dashed")
points(x2, pch = 19, col = 'red', cex = 1)

# C)
x3 <- cos(2*pi*(1:100)/4) + w
v3 <- filter(x3, rep(1/4, 4), method="convolution")
plot.ts(x3, main="Cosine TS with noise")
lines(v3, lty = "dashed")
points(x3, pch = 19, col = 'red', cex = 1)


