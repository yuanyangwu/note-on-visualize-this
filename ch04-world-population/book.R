setwd("C:/Users/wuf2/Documents/GitHub/note-on-visualize-this/ch04-world-population")
population <- read.csv("world-population.csv", sep=",", header=TRUE)

plot(population$Year, population$Population, type="l",
  ylim=c(0, 7000000000), xlab="Year", ylab="Population")
