library("ggplot2")

# Load data
tvs <- read.table('C:/Users/wuf2/Documents/GitHub/note-on-visualize-this/ch06-tv-sizes/tv_sizes.txt',
  sep="\t", header=TRUE)

# Filter outliers
tvs <- tvs[tvs$size < 80, ]
tvs <- tvs[tvs$size > 10, ]

# Set breaks for histograms
breaks = seq(10, 80, by=5)

func <- function(is.book) {

  if (is.book) {

    # Set the layout
    par(mfrow=c(9,1))
    
    # Draw histograms, one by one
    for (y in 2001:2009) {
      hist(tvs[tvs$year == y,]$size, breaks = breaks,
        main = paste("Histogram of Size in", y),
        xlab = "Size")
    }

  } else {
    
    p <- ggplot(tvs, aes(x = size))
    p <- p + geom_histogram(fill = "white", colour = "black", breaks = breaks)
    #p <- p + geom_bar(fill = "white", colour = "black")
    #p <- p + stat_bin(binwidth = 5)
    #p <- p + stat_bin(breaks = breaks)
    p <- p + facet_grid(year ~ .)
    p
  }

}

png("book.png", width=400, height=1200)
func(is.book = TRUE)
dev.off()

png("mine.png", width=400, height=1200)
func(is.book = FALSE)
dev.off()
