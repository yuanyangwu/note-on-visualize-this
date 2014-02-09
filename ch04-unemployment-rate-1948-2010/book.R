setwd("C:/Users/wuf2/Documents/GitHub/note-on-visualize-this/ch04-unemployment-rate-1948-2010")
unemployment <- read.csv("unemployment-rate-1948-2010.csv", sep=",", header=TRUE)

# Plain scatter plot
plot(1:length(unemployment$Value), unemployment$Value)

scatter.smooth(x=1:length(unemployment$Value),
  y=unemployment$Value, ylim=c(0,11), degree=2, col="#CCCCCC", span=0.5)


