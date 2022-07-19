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
    newVariable1[i] <- 1
  }
  else if(sulphates[i] <= 0.7 && sulphates[i] >0.4){
    newVariable1[i] <- 2
  }
  else if(sulphates[i] > 0.7){
    newVariable1[i] <- 3
  }
}

#Construct boxplot
boxplot(newVariable1, quality,
        main = "New Variable(sulphates) against Quality",
        names = c("New Variable 1", "Quality")) #DELETE FOR REPORT

boxplot(newVariable1~quality,
        main = "New Variable(sulphates) against Quality",
        xlab = "Quality",
        ylab = "New Variable 1")

newVariable2 <- vector()

for(i in seq_along(pH)){
  if(pH[i] <=3.15){
    newVariable2[i] <- 1
  }
  else if(pH[i] <= 3.45 && pH[i] >3.15){
    newVariable2[i] <- 2
  }
  else if(pH[i] >3.45){
    newVariable2[i] <-3
  }
}

boxplot(newVariable2~quality,
        main = "New Variable(pH) against Quality",
        xlab = "Quality",
        ylab = "New Variable 2")

#2
isPrime <- function(n){
  if(n == 2){
    return(TRUE)
  }
  for(x in 2:n){
    if(n %% x == 0){
      return(FALSE)
    }
    else{
      return(TRUE)
    }
  }
}

primeNumbers <-function (){
  for( i in 2:1000){
    if(isPrime(i)){
      cat(i, "\n")
    }
  }
}
#Call function
primeNumbers()

#3
set.seed(19191)
a <- rnorm(50)
ecdf(a)
plot(ecdf(a))

empCumDis <- function(v){
  edf <- vector()
  #values <- vector()
  for(i in seq_along(v)){
    curr <- v[i] #stores current value
    edfVal <- 0
    count <- 0
    for(j in seq_along(v)){
      if(v[j] <= curr){
        count <- count+1
      }
    }
    edfVal <- count/length(v)
    edf <- c(edf,edfVal)
    #values <- c(values, curr)
  }
  plot(v, edf)
}
#Call function
empCumDis(a)

#4
#a
x <- 0:9
if (x[1] =1){
  print(x)
}
#Error: the "=" is assigning a value to the variable x, we need to use "==" for comparisions.

#b
myfactorial <- function(x){
  if(x == 1)
    return(1)
  else
    return( x*myfactorial(x))

}
myfactorial(5)
#Error: this is a recursive function, in a recursive function it calls itself, but there must be a change in the input variable, otherwise it will be an infinite call.

#c
f <- function(n){
  if(n ==1)
    return(1)
  else{
    if (n %% 2 == 0)
      return (n/2)
    else
      return(3*x)
  }
}
x <- 1
f(x)
n <- 3
f(n)
#Error:variable "x" cannot be used inside the function unless it is added as a parameter of the function f().

#d
f1 <- function(.){
  if(runif(1)>5)
    x <- 1
  return (x)
}
x <- 0
sapply(1:10, f1)
x
#Error: the parameter is not used inside the function, assigning the variable "x" with 0 outside the function does not impact the function unless it is a parameter to the function.