##
#
# Reproducibility material for 'Direct and Indirect Welfare Chauvinism as Party Strategies: An Analysis of the Danish People's Party'
#
# Romana Careja, Christian Elmelund-Præstekær, Michael Baggesen Klitgaard, Erik Gahner Larsen
#
# This file creates the logistic regression models (Table 2) and Figure 1 in the paper
#
##

# Load package(s)
library("ggplot2")
library("Matrix")
library("lme4")
library("stargazer")

# Load dataset
prw <- read.csv("prw.csv")

# Figure 1: Data frame
fig1data <- as.data.frame(table(prw$retrenchment,prw$specific))

fig1data$retrenchment <- NA
fig1data$retrenchment[fig1data$Var1 == 1] <- "Retrenchment"
fig1data$retrenchment[fig1data$Var1 == 0] <- "Expansion"

fig1data <- fig1data[fig1data$Var2 != 0,]
fig1data <- data.frame(fig1data,
  group = factor(c("Other","Other","Elderly","Elderly","Disabled","Disabled","Young","Young","Immigrants","Immigrants","Women","Women","Long-term \n unemployed","Long-term \n unemployed"), levels=unique(c("Other","Other","Elderly","Elderly","Disabled","Disabled","Young","Young","Immigrants","Immigrants","Women","Women","Long-term \n unemployed","Long-term \n unemployed")), ordered=TRUE), 
  specific = fig1data$Freq, 
  Type = fig1data$retrenchment)

# Figure 1: Plot
png('figure1.png', height=3, width=8, units="in",res=600)
ggplot(fig1data, aes(x=group, y=specific, fill=Type)) +
  geom_bar(position=position_dodge(.9), colour="black", stat="identity") +
  coord_cartesian(ylim=c(0,8)) +
  scale_y_continuous(breaks=seq(0,8,1)) +
  scale_fill_grey() +
  theme_bw() +
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_line( size=.1)) +
  xlab("Target group") + 
  ylab("Reforms")
dev.off()

# Model 1
model1 <- glm(retrenchment ~ as.factor(rwgov), data = prw, family = "binomial")

plogis(predict(model1, newdata=data.frame(rwgov = 0), type="link"))

plogis(predict(model1, newdata=data.frame(rwgov = 1), type="link"))

# Model 2
model2 <- glm(retrenchment ~ as.factor(specific_d), data = prw[!is.na(prw$rwgov),], family = "binomial")

plogis(predict(model2, newdata=data.frame(specific_d = 0), type="link"))

plogis(predict(model2, newdata=data.frame(specific_d = 1), type="link"))

# Model 3
model3 <- glm(retrenchment ~ as.factor(rwgov) + as.factor(specific_d), data = prw, family = "binomial")

# Get results
stargazer(model1, model2, model3, type="text")

# Additional results (not reported in manuscript)
## Year random effects
model1.year <- glmer(retrenchment ~ as.factor(rwgov) + (1 | year), data = prw, family = binomial)
model2.year <- glmer(retrenchment ~ as.factor(specific_d) + (1 | year), data = prw[!is.na(prw$rwgov),], family = binomial)
model3.year <- glmer(retrenchment ~ as.factor(rwgov) + as.factor(specific_d) + (1 | year), data = prw, family = binomial)

stargazer(model1.year, model2.year, model3.year, type="text")

## Test for interaction
prw$dpp <- ifelse(prw$year < 1995, 0, 1)

model4 <- glm(retrenchment ~ dpp*as.factor(rwgov) + as.factor(specific_d), data = prw, family = "binomial")
model5 <- glm(retrenchment ~ as.factor(rwgov) + dpp*as.factor(specific_d), data = prw, family = "binomial")

stargazer(model4, model5, type="text")

# Create sessionInfo.txt
writeLines(capture.output(sessionInfo()), "sessionInfo.txt")