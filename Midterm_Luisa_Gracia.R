wineData <- read.csv("winequality-red.csv", sep = ";", header = TRUE)
head(wineData)
#Prepare variables
fixedAcidity <- wineData$fixed.acidity #1
volatileAcidity <- wineData$volatile.acidity #2
citricAcid <- wineData$citric.acid #3
residualSugar <- wineData$residual.sugar #4
chlorides <- wineData$chlorides #5
freeSulfurDioxide <- wineData$free.sulfur.dioxide #6
totalSulfurDioxide <- wineData$total.sulfur.dioxide #7
density <- wineData$density #8
pH <- wineData$pH #9
sulphates <- wineData$sulphates #10
alcohol <- wineData$alcohol #11
quality <- wineData$quality #12

#1a
#Create histogram to view where most wines lay in terms of  quality
hist(quality)
#1b
#construct scatterplot for each variable against the dependent variable "quality"
#1. fixed.acidity
plot(quality, fixedAcidity, main = "Scatterplot",
     xlab = "Wine Quality", ylab = "Fixed Acidity")
#2. volatile.acidity
plot(quality, volatileAcidity, main = "Scatterplot",
     xlab = "Wine Quality", ylab = "Volatile Acidity")
#3. citric.acid
plot(quality, citricAcid, main = "Scatterplot",
     xlab = "Wine Quality", ylab = "Citric Acid")
#4. residual.sugar
plot(quality, residualSugar, main = "Scatterplot",
     xlab = "Wine Quality", ylab = "Residual Sugar")
#5. chlorides
plot(quality, chlorides, main = "Scatterplot",
     xlab = "Wine Quality", ylab = "Chlorides")
#6 free.sulfur.dioxide
plot(quality, freeSulfurDioxide, main = "Scatterplot",
     xlab = "Wine Quality", ylab = "Free Sulfur Dioxide")
#7. total.sulfur.dioxide
plot(quality, totalSulfurDioxide, main = "Scatterplot",
     xlab = "Wine Quality", ylab = "Total Sulfur Dioxide")
#8. density
plot(quality, density, main = "Scatterplot",
     xlab = "Wine Quality", ylab = "Density")
#9. pH
plot(quality, pH, main = "Scatterplot",
     xlab = "Wine Quality", ylab = "pH")
#10. sulphates
plot(quality, sulphates, main = "Scatterplot",
     xlab = "Wine Quality", ylab = "Sulphates")
#11. alcohol
plot(quality, alcohol, main = "Scatterplot",
     xlab = "Wine Quality", ylab = "Alcohol")

#1c
#Construct Boxplots
boxplot(fixedAcidity, volatileAcidity, citricAcid, residualSugar, chlorides, freeSulfurDioxide, totalSulfurDioxide, density, pH, sulphates, alcohol,
        main = "Boxplots for all variables",
        names= c("Fixed Acidity", "Volatile Acidity", "Citric Acid", "Residual Sugar", "Chlorides", "Free Sulfur Dioxide", "Total Sulfu Dioxide", "Density", "pH", "Sulphates", "Alcohol"))

#1d
#Summary gives back min, median, mean, and max for all variables
summary(wineData)
#variance
var(wineData)
#SD
sd(fixedAcidity)
sd(volatileAcidity)
sd(citricAcid)
sd(residualSugar)
sd(chlorides)
sd(freeSulfurDioxide)
sd(totalSulfurDioxide)
sd(density)
sd(pH)
sd(sulphates)
sd(alcohol)
sd(quality)
#skewness
library(e1071)
skewness(fixedAcidity)
skewness(volatileAcidity)
skewness(citricAcid)
skewness(residualSugar)
skewness(chlorides)
skewness(freeSulfurDioxide)
skewness(totalSulfurDioxide)
skewness(density)
skewness(pH)
skewness(sulphates)
skewness(alcohol)
skewness(quality)
#Kurtosis
kurtosis(fixedAcidity)
kurtosis(volatileAcidity)
kurtosis(citricAcid)
kurtosis(residualSugar)
kurtosis(chlorides)
kurtosis(freeSulfurDioxide)
kurtosis(totalSulfurDioxide)
kurtosis(density)
kurtosis(pH)
kurtosis(sulphates)
kurtosis(alcohol)
kurtosis(quality)

#1e
newVariable1 <- vector()

for(i in seq_along(sulphates)){
  if(sulphates[i] <=0.4){
    newVariable1[i] = 1
  }
  else if(sulphates[i] <= 0.7 && sulphates[i] >0.4){
    newVariable1[i] = 2
  }
  else if(sulphates[i] > 0.7){
    newVariable1[i] = 3
  }
}

