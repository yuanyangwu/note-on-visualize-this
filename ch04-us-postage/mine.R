library("ggplot2")

setwd("C:/Users/wuf2/Documents/GitHub/note-on-visualize-this/ch04-us-postage")
postage <- read.csv("us-postage.csv", sep=",", header=TRUE)

func <- function(is.book) {

  if (is.book) {

    plot(postage$Year, postage$Price, type="s",
      main="US Postage Rates for Letters, First Ounce, 1991-2010",
      xlab="Year", ylab="Postage Rate (Dollars)")

  } else {

    p <- ggplot(postage, aes(x=Year, y=Price))
    p <- p + geom_step(stat="identity")

    # title
    p <- p + ggtitle("US Postage Rates for Letters, First Ounce, 1991-2010")

    # NO need to assign X axis label for default is same as variable name
    # assign Y axis label  
    p <- p + ylab("Postage Rate (Dollars)")

    # y limit
    p <- p + ylim(0.28, 0.45)

    p
  }
}

png("book.png", width=400, height=400)
func(is.book = TRUE)
dev.off()

png("mine.png", width=400, height=400)
func(is.book = FALSE)
dev.off()

