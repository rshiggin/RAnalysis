setwd("~/cyberdh/HILT-demo")
library(ggplot2)
text.janeEyre <- scan("janeEyre.txt", what="character", sep="\n")
text.janeEyre <- c(text.janeEyre, "END")
positions.janeEyre <- grep("^CHAPTER ", text.janeEyre)
last.janeEyre <- length(text.janeEyre)
positions.janeEyre <- c(positions.janeEyre, last.janeEyre)
rawsl.janeEyre <- list()
freqsl.janeEyre <- list()
for (i in 1:length(positions.janeEyre)) {
  if (i != length(positions.janeEyre)) {
    number.janeEyre <- text.janeEyre[positions.janeEyre[i]]
    start.janeEyre <- positions.janeEyre[i] +1
    end.janeEyre <- positions.janeEyre[i+1] -1
    chapter.janeEyre <- text.janeEyre[start.janeEyre:end.janeEyre]
    wordsv.janeEyre <- tolower(paste(chapter.janeEyre, collapse= " "))
    wordsl.janeEyre <- strsplit(wordsv.janeEyre, "\\W")
    wordv.janeEyre <- unlist(wordsl.janeEyre)
    wordv.janeEyre <- wordv.janeEyre[which(wordv.janeEyre != "")]
    freqst.janeEyre <- table(wordv.janeEyre)
    rawsl.janeEyre[[number.janeEyre]] <- freqst.janeEyre
    freqst.rel.janeEyre <- 100*(freqst.janeEyre/sum(freqst.janeEyre))
    freqsl.janeEyre[[number.janeEyre]] <- freqst.rel.janeEyre
  }
}

hapaxv.janeEyre <- sapply(rawsl.janeEyre, function(x) sum(x == 1))
lengthsm.janeEyre <- do.call(rbind, lapply(rawsl.janeEyre,sum))
percentage.janeEyre <- hapaxv.janeEyre / lengthsm.janeEyre
barplot(percentage.janeEyre, beside = T, col="grey", main="Hapax by Chapter in Jane Eyre",names.arg=seq(1:length(rawsl.janeEyre)))
