ccs <- read.csv("ccs.csv",header = T)
ccsTS <- ts(ccs[[4]], frequency = 12, start = c(1991,1))
plot(ccsTS,main="Singapore CCS, Jan. ‘91 – Aug ‘15.")

# take log to smooth out the variance
ccsL <- log(ccsTS)

Mo = factor(rep(1:12,24))  # cycle ( time series ) for 24 years

trend <- 1:288
Sreg = lm(log(ccs[[4]][1:288]) ~ trend + Mo, na.action=NULL) # running OLS on two variables, one is time trend and another is time trend cycling from 1:12 -- 
summary(Sreg)

plot(ccsL,main="Log of CCS and fitting")
lines(ts(fitted(Sreg),frequency = 12, start = c(1991,1)), col="red")

plot(ts(resid(Sreg),frequency = 12, start = c(1991,1)))
abline(0,0)
plot(Sreg)

Months <- c(Sreg$coefficients[1],
            Sreg$coefficients[1] + Sreg$coefficients[3:13]) # So the intercept and months have the same value??
Season <- Months -mean(Months) # seasonality # Why do we deduct the mean?? Not sure about this.
names(Season)[1] <- "Mo1"
data.frame(Season)

(Intercept <-  mean(Months)) 