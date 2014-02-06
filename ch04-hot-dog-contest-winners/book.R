setwd("C:/Users/wuf2/Documents/GitHub/note-on-visualize-this/ch04-hot-dog-contest-winners")
hotdogs <- read.csv("hot-dog-contest-winners.csv", sep=",", header=TRUE)

is.singlecolor <- FALSE
if (is.singlecolor) {
  # fill single color
  barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, col="red", border=NA, xlab="Year", ylab="Hod dogs and buns (HDB) eaten")

} else {

  # generate conditional colors
  fill_colors <- c()
  for ( i in 1:length(hotdogs$Country) ) {
    if (hotdogs$Country[i] == "United States") {
      fill_colors <- c(fill_colors, "#821122")
    } else {
      fill_colors <- c(fill_colors, "#cccccc")
    }
  }

  # fill conditional colors
  barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, col=fill_colors, border=NA, space=0.3, xlab="Year", ylab="Hod dogs and buns (HDB) eaten")
}
