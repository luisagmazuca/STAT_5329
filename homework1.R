#Luisa V. Gracia Mazuca ID:80627584
#STAT 5329

#Homework 1
#Vectors to test functions
v1 <- (1:10)
v2 <- seq(1,20, by=2)
v3 <- c(3,NA,4,5,NA)
v4 <- c(1,NA,3,7,NA)
temp <- seq(-15,40, by=5)

#PROBLEM 1
#a. Questions 4 and 5 in 19.2.1
#Q4
compute_variance_skewness <- function(vec){
  m <- (sum(vec)/length(vec)) #calculates mean
  n <- length(vec)
  calc_var <- (1/(n-1))*sum((vec-m)^2) #calculates variance from mean
  skew <- ((1/(n - 2))*sum((vec - m)^3))/((calc_var^(3/2)))
  return(skew)
}

#Q5
both_na <- function(vec1, vec2){
  pos <- 0
  for(i in seq_along(vec1)){
    if (is.na(vec1[i]) && is.na(vec2[i])){
      pos <- pos+1
    }
  }
  return(pos)
}

#b. Question 4 in 19.4.4
cut(temp, breaks = c(-Inf, 0, 10, 20, 30, Inf),
    right = FALSE, #set to false, intervals will be closed on the left and open on the right
    labels = c("freezing", "cold", "cool", "warm", "hot"))

#Answer: cut takes as an argument a numeric vector, in case we have more than one value for temp using cut() would be most useful.

#PROBLEM 2
#a. Questions 2 and 3 in 21.2.1
#Q2
#install.packages("stringr")
library("stringr")
str_c(letters, collapse = "")

sd(v2)

all.equal(cumsum(x), out)

#Q3
#Part 1
for(i in 5:0){
  for(j in 1:3){
    cat("Alice the camel has", i, "humps", "\n")
  }
  if(i > 0){
    cat("So go, Alice, go!", "\n", "Boom, boom, boom, boom!", "\n")
  }
  else{
    cat("Cause Alice is a horse, of course!")
  }
}

#Part 2
ten_in_the_bed <-function(num_people, sleeping_structure){
  for(i in num_people:1){
    cat("There were", i, "in the", sleeping_structure, "\nAnd the little one said")
    if(i > 1){
      cat("\nRoll over!Roll over! \nSo they  all rolled over and one fell out \n")
    }
    else{
      cat("\nAlone at last! \nGood Night!")
    }
  }
}

#Part 3
num_of_bottles_of_beer_song <- function(num_bottles,liquid, surface){
  for(i in num_bottles:0){
    if(i > 1){
      cat(i, "bottles of", liquid, "on the", surface, ",", i, "bottles of", liquid, ".", "\nTake one down and pass it around,", i, "bottles of", liquid, "on the", surface,". \n")
    }
    else if(i>0){
      cat(i, "bottle of", liquid, "on the", surface, ",", i, "bottle of", liquid, ".", "\nTake one down and pass it around, no more bottles of", liquid, "on the", surface,".")
    }
    else{
      cat("No more bottles of", liquid, "on the", surface, ", no more bottles of", liquid, ".", "Go to the store and buy some more,", num_bottles, "bottles of", liquid, "on the", surface,".")
    }
  }
}

#b. Questions 4 and 5 in 21.5.3
#Q4
#What does map(-2:2, rnorm, n = 5) do? Why?
#Answer: it returns a vector of five random elemets elements with values between -2 and 2, the values in the vector are normally distributed.

#What does map_dbl(-2:2, rnorm, n = 5) do? Why?
#Answer: it raises an error as it is supposed to return a vector of one element

#Q5
#install.packages("purrr")
library("purrr")
#install.packages("ggplot2")
library("ggplot2")

map(x, ~ lm(mpg ~ wt, data = .))

#PROBLEM 3
#a. Questions 4 and 5 in 20.4.6
#Q4
#Part 1
last_value <- function(vec){
  len <- length(vec)
  return(vec[len])
}

#Part 2
return_even_positions <- function(vec){
  for(i in seq_along(vec)){
    if(i %% 2 == 0){
      print((vec[i]))
    }
  }
}

#Part 3
every_element_but_last <- function(vec){
  for(i in seq_along(vec)){
    if(i != length(vec)){
      print(vec[i])
    }
  }
}

#Part 4
print_even <- function(vec){
  for(i in seq_along(vec)){
    if(vec[i] %% 2 == 0){
      print(vec[i])
    }
  }
}
#Q5
#Why is x[-which(x > 0)] not the same as x[x <= 0]?
#Answer: In case we have a vector with special values such as NA and NaN, x[x <= 0] does not take into account NaN values, so it does not return those values.
#The function which() drops the negative integers but does leave the special values including -Inf.

#PROBLEM 4
combine <- function(x,y, op){
  if (op == "plus"){
    return (x + y)
  }
  else if (op == "minus"){
    return (x -y)
  }
  else if (op == "times"){
    return (x * y)
  }
  else if (op == "divide"){
    return (x / y)
  }
}