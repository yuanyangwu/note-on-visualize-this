library("ggplot2")

setwd("C:/Users/wuf2/Documents/GitHub/note-on-visualize-this/ch04-unemployment-rate-1948-2010")
unemployment <- read.csv("unemployment-rate-1948-2010.csv", sep=",", header=TRUE)

func <- function(is.book) {
  if (is.book) {

    # Plain scatter plot
    plot(1:length(unemployment$Value), unemployment$Value)

    scatter.smooth(x=1:length(unemployment$Value),
      y=unemployment$Value, ylim=c(0,11), degree=2, col="#CCCCCC", span=0.5)

  } else {

    p <- ggplot(unemployment, aes(x=1:length(Value), y=Value))

    # shape #21 is hollow circle
    p <- p + geom_point(size = 3, shape = 21, color = "#CCCCCC")

    # se = FALSE hides confidence interval
    p <- p + stat_smooth(se = FALSE, color = "black", method = "loess", degree = 2, span = 0.5)

    # y limit
    p <- p + ylim(0, 11)

    # x label
    p <- p + xlab("Index")

    # tune panel and axis color
    p <- p + theme(panel.border = element_blank(),
        panel.grid = element_blank(), panel.background = element_blank(),
        axis.line = element_line(colour="black"))
    p
  }
}

png("book.png", width=400, height=400)
func(is.book = TRUE)
dev.off()

png("mine.png", width=400, height=400)
func(is.book = FALSE)
dev.off()


