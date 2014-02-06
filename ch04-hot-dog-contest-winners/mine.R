library("ggplot2")

setwd("C:/Users/wuf2/Documents/GitHub/note-on-visualize-this/ch04-hot-dog-contest-winners")
hotdogs <- read.csv("hot-dog-contest-winners.csv", sep=",", header=TRUE)

func <- function(is.singlecolor, is.book) {
  if (is.singlecolor) {
    fill_colors <- "red"
  } else {
    # generate conditional colors
    if (is.book) {
      fill_colors <- c()
      for ( i in 1:length(hotdogs$Country) ) {
        if (hotdogs$Country[i] == "United States") {
          fill_colors <- c(fill_colors, "#821122")
        } else {
          fill_colors <- c(fill_colors, "#cccccc")
        }
      }
    } else {
      fill_colors <- ifelse(hotdogs$Country == "United States",
        "#821122", "#cccccc")
    }
  }
  
  if (is.book) {
  
    barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year,
      col=fill_colors,
      xlab="Year", ylab="Hod dogs and buns (HDB) eaten",
      border=NA, space=0.3
      )
  
  } else {
  
    #   ggplot code
    p <- ggplot(hotdogs, aes(x=Year, y=Dogs.eaten))
    p <- p + geom_bar(stat="identity", fill=fill_colors, width=0.7)
    #     NO need to assign X axis label for default is same as variable name
    #     assign Y axis label  
    p <- p + ylab("Hod dogs and buns (HDB) eaten")
    #     tune panel and axis color
    p <- p + theme(panel.border = element_blank(), panel.grid = element_blank(), panel.background = element_blank(), axis.line = element_line(colour="black"))
    p
  
  }

}

png("single-color-book.png", width=400, height=400)
func(is.singlecolor = TRUE,  is.book = TRUE)
dev.off()

png("single-color-mine.png", width=400, height=400)
func(is.singlecolor = TRUE,  is.book = FALSE)
dev.off()

png("conditional-color-book.png", width=400, height=400)
func(is.singlecolor = FALSE, is.book = TRUE)
dev.off()

png("conditional-color-mine.png", width=400, height=400)
func(is.singlecolor = FALSE, is.book = FALSE)
dev.off()