library(TOSTER)

data <- read.csv("data/RootGrowth.csv", stringsAsFactors = F)

#Data Extraction 
VD3 <- as.double(data[c(2:13),"X"])
WildType <- as.double(data[c(2:13),"Root.growth.after.45.d..cm"])
WildType <- WildType[!is.na(WildType)]

VD3sd <- sd(VD3)
WTsd <- sd(WildType)
VD3mean <- mean(VD3)
WTmean <- mean(WildType)

theta <- log(x = 1.25)

theta_test <- 1.823
SD_test <- (VD3sd + WTsd) / 2

print(TOSTtwo.raw(
  m1 = VD3mean,
  m2 = WTmean,
  sd1 = VD3sd, 
  sd2 = WTsd,
  n1 = length(WildType), n2 = length(VD3),
  low_eqbound = -theta_test,
  high_eqbound = theta_test,
  alpha = 0.05,
  var.equal = FALSE,
  plot = TRUE
))

# Because maximum p-value is .50 with (lower being .320), is bigger
# than alpha, we fail to reject the null (meaning they are not equiv)
# we can demonstrate that equivalence has not been demonstrated