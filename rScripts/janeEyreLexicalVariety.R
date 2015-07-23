setwd("~/cyberdh/HILT-demo")
text.v <- scan("janeEyre.txt", what="charchapterer", sep="\n")
text.v <- c(text.v, "END")
chapter.positions.v <- grep("^CHAPTER ", text.v)
last.position.v <- length(text.v)
chapter.positions.v <- c(chapter.positions.v, last.position.v)

chapter.raws.l <- list()
chapter.freqs.l <- list()

for (i in 1:length(chapter.positions.v)) {
  if (i != length(chapter.positions.v)) {
    chapter.number <- text.v[chapter.positions.v[i]]
    start <- chapter.positions.v[i] +1
    end <- chapter.positions.v[i+1] -1
    chapter.v <- text.v[start:end]
    chapter.words.v <- tolower(paste(chapter.v, collapse= " "))
    chapter.words.l <- strsplit(chapter.words.v, "\\W")
    chapter.word.v <- unlist(chapter.words.l)
    chapter.word.v <- chapter.word.v[which(chapter.word.v != "")]
    chapter.freqs.t <- table(chapter.word.v)
    chapter.raws.l[[chapter.number]] <- chapter.freqs.t
    chapter.freqs.t.rel <- 100*(chapter.freqs.t/sum(chapter.freqs.t))
    chapter.freqs.l[[chapter.number]] <- chapter.freqs.t.rel
  }
}

mean.word.use.m <- do.call(rbind, lapply(chapter.raws.l, mean))
plot(scale(mean.word.use.m), type="h", main = "Mean Word Usage in Jane Eyre by chapter")

# Longer lines or more deviation from mean = more repetition of the same words.   

Acknowledgments: Code adapted from Matthew Jockers’ _Text Analysis with R for Students of Literature_.