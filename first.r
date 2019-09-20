#!/usr/bin/Rscript
#!/usr/bin/env Rscript
cat("What is your name? ")
x <- readLines("stdin", 1)
cat(sprintf("Hello, %s!\n", x))
