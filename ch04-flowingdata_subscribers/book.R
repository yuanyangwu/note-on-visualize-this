setwd("C:/Users/wuf2/Documents/GitHub/note-on-visualize-this/ch04-flowingdata_subscribers")
subscribers <- read.csv("flowingdata_subscribers.csv", sep=",", header=TRUE)

plot(subscribers$Subscribers, type="p", ylim=c(0, 30000))

plot(subscribers$Subscribers, type="h", ylim=c(0, 30000),
  xlab="Day", ylab="Subscribers")
points(subscribers$Subscribers, pch=19, col="black")