library("ggplot2")

setwd("C:/Users/wuf2/Documents/GitHub/note-on-visualize-this/ch04-world-population")
population <- read.csv("world-population.csv", sep=",", header=TRUE)

func <- function(is.book) {

  if (is.book) {

    plot(population$Year, population$Population, type="l",
      ylim=c(0, 7000000000), xlab="Year", ylab="Population")

  } else {

    p <- ggplot(population, aes(x=Year, y=Population))
    p <- p + geom_line()

    # y limit
    p <- p + ylim(0, 7000000000)

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

