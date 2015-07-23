setwd("~/cyberdh/HILT-demo")
library(ggplot2)
text.v <- scan("hamlet.txt", what="character", sep="\n")
hamlet.v <- paste(text.v, collapse="  ")
hamlet.lower.v <- tolower(hamlet.v)
hamlet.words <- strsplit(hamlet.lower.v, "\\W")
hamlet.word.v <- unlist(hamlet.words)
not.blanks.v <- which(hamlet.word.v != "")
hamlet.word.v <- hamlet.word.v[not.blanks.v]
text.position.v <- seq(1:length(hamlet.word.v))
love.v <- which(hamlet.word.v == "love")
w.count.v <- rep(NA, length(text.position.v))
w.count.v[love.v] <- 1
matplot(w.count.v, main="Dispersion Plot of 'love' in Hamlet", xlab="Text Location",
      ylab="Love", type="h",  ylim=c(0,1), yaxt='n')
