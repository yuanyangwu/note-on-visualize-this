library("ggplot2")

setwd("C:/Users/wuf2/Documents/GitHub/note-on-visualize-this/ch04-flowingdata_subscribers")
subscribers <- read.csv("flowingdata_subscribers.csv", sep=",", header=TRUE)

func <- function(is.book, is.point) {

  if (is.point) {
    if (is.book) {
      plot(subscribers$Subscribers, type="p", ylim=c(0, 30000), xlab="Day")
    } else {

      p <- ggplot(subscribers, aes(x=1:length(Subscribers), y=Subscribers))

      # shape #21 is hollow circle
      p <- p + geom_point(size = 3, shape = 21)

      # y limit
      p <- p + ylim(0, 30000)

      # x label
      p <- p + xlab("Day")

      # tune panel and axis color
      p <- p + theme(panel.border = element_blank(),
          panel.grid = element_blank(), panel.background = element_blank(),
          axis.line = element_line(colour="black"))
      p

    }
  } else {
    if (is.book) {
      plot(subscribers$Subscribers, type="h", ylim=c(0, 30000),
        xlab="Day", ylab="Subscribers")
      points(subscribers$Subscribers, pch=19, col="black")
    } else {

      p <- ggplot(subscribers, aes(x=1:length(Subscribers), y=Subscribers))
      p <- p + geom_bar(stat="identity", width=0.1)

      # by default is shape #16 (solid circle)
      p <- p + geom_point(size = 3)

      # y limit
      p <- p + ylim(0, 30000)

      # x label
      p <- p + xlab("Day")

      # tune panel and axis color
      p <- p + theme(panel.border = element_blank(),
          panel.grid = element_blank(), panel.background = element_blank(),
          axis.line = element_line(colour="black"))
      p

    }
  }
}

png("point-book.png", width=400, height=400)
func(is.point = TRUE,  is.book = TRUE)
dev.off()

png("point-mine.png", width=400, height=400)
func(is.point = TRUE,  is.book = FALSE)
dev.off()

png("candlestick-book.png", width=400, height=400)
func(is.point = FALSE, is.book = TRUE)
dev.off()

png("candlestick-mine.png", width=400, height=400)
func(is.point = FALSE, is.book = FALSE)
dev.off()

