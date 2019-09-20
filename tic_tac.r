#!/usr/bin/Rscript
one_player <- function() {
  my_matrix <- matrix(data=5, nr=3, nc=3)
  return(my_matrix)
}

two_players <- function() {
  player = 2
  flag = 0
  while (flag != 1) {
    print(my_matrix)
    if (player == 1){
      player = 2
      move(player)
    } else {
      player = 1
      move(player)
    }
   }
}


move <- function(player) {
  cat(sprintf("Player %s: Your move (format - row , column - )", player))
  move <- readLines("stdin", 1)
  print(move)
  a = as.integer(substr(move, start=1, stop=1))
  b = as.integer(substr(move, start=3, stop=3))
  isbusy = busy(a, b)
  if (isbusy == TRUE) {
    move(player)
  } else {
    my_matrix[a, b] <<- player
    winner(player, a, b)
    return()
  }
}


busy <- function(a, b) {
  pos <- my_matrix[a, b]
  cat(sprintf("Este es pos %s\n", pos))
  if (pos != 0) {
    cat("Your move is already fill\n")
    return(TRUE)
  } else {
    return(FALSE)
  }
}


winner <-function(player, a, b) {
  if (max(my_matrix[a, ]) == min(my_matrix[a, ])) {
    cat("TRIQUI")
  } else {
    if (max(my_matrix[ ,b]) == min(my_matrix[ ,b])) {
       cat("TRIQUI")
       }
       else {
         move(player)
       }
  }
}



# This is code to play TicTacToe with 1 o 2 players
# program start here
cat("Welcome to TicTacToe in R Language\n")
cat("Please choose 1 player or 2 players\n")
players <- readLines("stdin", 1)
cat(sprintf("You choose: %s\n", players))
my_matrix <- "global"
my_matrix <- matrix(data=0, nr=3, nc=3)
while (players > 2)
{
  cat("Choose only 1 or 2 players")
  players <- readLines("stdin", 1)
  cat(sprintf("You choose, %s\n", players))
}
if (players == 1) {
  a = one_player()
  print(a)
} else {
  a = two_players()
  print(a)
}
