########################### standard error and confidence intervals ######################
# compute estimated standard error for mean
Tobs = nrow(funds.ret.mat)
Tobs
se.muhat = sigmahat/sqrt(Tobs)
se.muhat

# compute approx 95% confidence intervals and its width
mu.l = muhat - 2*se.muhat
mu.u = muhat + 2*se.muhat
cbind(mu.l, mu.u, mu.u - mu.l)

# compute estimated standard errors for variance and sd
se.varhat = varhat/sqrt(Tobs/2)
se.sigmahat = sigmahat/sqrt(2*Tobs)

se.varhat
se.sigmahat


#For Vanguard 500 Index Fund (VFINX) and Vanguard Emerging Markets Stock Index(VEIEX) compute 95% confidence intervals for mean  and standard deviation.
#How is  the precision of the estimates ?(if both positive and negative values are in the confidence interval, the estimate is not very precise)
#Is one of them estimated more precisely? 


# compute approx 95% confidence intervals and its width
var.l = varhat - 2*se.varhat
var.u = varhat + 2*se.varhat
cbind(var.l,var.u, var.u - var.l)

sigma.l = sigmahat - 2*se.sigmahat
sigma.u = sigmahat + 2*se.sigmahat
cbind(sigma.l,sigma.u,sigma.u - sigma.l)

# compute estimated standard errors for correlation
se.rhohat = (1-rhohat^2)/sqrt(Tobs)

se.rhohat
# compute approx 95% confidence intervals
rho.l = rhohat - 2*se.rhohat
rho.u = rhohat + 2*se.rhohat
cbind(rho.l,rho.u, rho.u - rho.l)

