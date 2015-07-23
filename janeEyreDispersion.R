setwd("~/cyberdh/HILT-demo")
library(ggplot2)
text.v <- scan("janeEyre.txt", what="character", sep="\n")
janeEyre.v <- paste(text.v, collapse="  ")
janeEyre.lower.v <- tolower(janeEyre.v)
janeEyre.words <- strsplit(janeEyre.lower.v, "\\W")
janeEyre.word.v <- unlist(janeEyre.words)
not.blanks.v <- which(janeEyre.word.v != "")
janeEyre.word.v <- janeEyre.word.v[not.blanks.v]
text.position.v <- seq(1:length(janeEyre.word.v))
love.v <- which(janeEyre.word.v == "love")
w.count.v <- rep(NA, length(text.position.v))
w.count.v[love.v] <- 1
matplot(w.count.v, main="Dispersion Plot of 'love' in Jane Eyre", xlab="Text Location",
        ylab="Love", type="h",ylim=c(0,1), yaxt='n')
