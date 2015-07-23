setwd("~/cyberdh/HILT-demo")
library(ggplot2)

text.v <- scan("hamlet.txt", what="character", sep="\n")
text.v <- c(text.v, "END")
act.positions.v <- grep("^ACT ", text.v)
last.position.v <- length(text.v)
act.positions.v <- c(act.positions.v, last.position.v)

act.raws.l <- list()
act.freqs.l <- list()

for (i in 1:length(act.positions.v)) {
  if (i != length(act.positions.v)) {
    act.number <- text.v[act.positions.v[i]]
    start <- act.positions.v[i] +1
    end <- act.positions.v[i+1] -1
    act.v <- text.v[start:end]
    act.words.v <- tolower(paste(act.v, collapse= " "))
    act.words.l <- strsplit(act.words.v, "\\W")
    act.word.v <- unlist(act.words.l)
    act.word.v <- act.word.v[which(act.word.v != "")]
    act.freqs.t <- table(act.word.v)
    act.raws.l[[act.number]] <- act.freqs.t
    act.freqs.t.rel <- 100*(act.freqs.t/sum(act.freqs.t))
    act.freqs.l[[act.number]] <- act.freqs.t.rel
  }
}

mean.word.use.m <- do.call(rbind, lapply(act.raws.l, mean))
plot(scale(mean.word.use.m), type="h", main = "Mean Word Usage in Hamlet by Act")
# Longer lines or more deviation from mean = more repetition of the same words.   

Acknowledgments: Code adapted from Matthew Jockers’ _Text Analysis with R for Students of Literature_.