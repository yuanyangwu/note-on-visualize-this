library("ggplot2")

setwd("C:/Users/wuf2/Documents/GitHub/note-on-visualize-this/ch04-hot-dog-places")
hot_dog_places <- read.csv("hot-dog-places.csv", sep=",", header=TRUE)

func <- function(is.book) {

  # change headers to remove confusing "X"
  # read.csv prepends numeric headers with "X".
  # For example, "2000" changes to "X2000"
  if (is.book) {

    names(hot_dog_places) <- c("2000", "2001", "2002", "2003", "2004",
      "2005", "2006", "2007", "2008", "2009", "2010")

  } else {

    # option 1: replace "X" with ""
    names(hot_dog_places) <- sub("X", "", names(hot_dog_places))

    # option 2: assign generated string names from numeric
    names(hot_dog_places) <- c(paste("200", 0:9, sep = ""), "2010")

  }

  hot_dog_matrix <- as.matrix(hot_dog_places)

  # plot
  if (is.book) {

    barplot(hot_dog_matrix, border=NA, space=0.25, ylim=c(0, 200),
      xlab="Year", ylab="Hot dogs and buns (HDBs) eaten",
      main="Hot Dog Eating Contest Results, 1980-2010")
  
  } else {
  
    # tranform places into data frame friendly to ggplot
    Count <- c(hot_dog_matrix)
    Order <- gl(3, 1, 3*11)
    ns <- names(hot_dog_places)
    Year <- sort(rep(ns, 3))
    data <- data.frame(Year, Order, Count)

    p <- ggplot(data, aes(x=Year, y=Count, fill=Order))
    p <- p + geom_bar(stat="identity")

    # title
    p <- p + ggtitle("Hot Dog Eating Contest Results, 1980-2010")

    # NO need to assign X axis label for default is same as variable name
    # assign Y axis label  
    p <- p + ylab("Hod dogs and buns (HDB) eaten")

    # y limit
    p <- p + ylim(0, 200)

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

