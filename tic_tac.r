#!/usr/bin/Rscript

two_players <- function() {
  player = 2
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
  cat("THANKS FOR PLAY WITH US\n")
}


move <- function(player) {
  cat(sprintf("Player %s: Your move (format - row , column - )\n", player))
  if (player == 1){
    move <- readLines("stdin", 1)
    print(move)
    a = as.integer(substr(move, start=1, stop=1))
    b = as.integer(substr(move, start=3, stop=3))
  } else if (player == 2 & aut == 0) {
    move <- readLines("stdin", 1)
    print(move)
    a = as.integer(substr(move, start=1, stop=1))
    b = as.integer(substr(move, start=3, stop=3))
  } else {
    a = as.integer(sample(1:3, 1, replace=F))
    b = as.integer(sample(1:3, 1, replace=F))
  }
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
  if (pos != 0) {
    if (aut == 1) {
      cat("Your move is already fill\n")
    }
    return(TRUE)
  } else {
    return(FALSE)
  }
}


winner <-function(player, a, b) {
  second <- c(my_matrix[1,3], my_matrix[2,2], my_matrix[3,1])
  if (max(my_matrix[a, ]) == min(my_matrix[a, ]))
  {
    cat("TRIQUI\n")
    if (aut == 0){
       cat(sprintf("THE WINNER IS PLAYER %s", player))
    }
    else
    {
       if(player == 2)
       {
         cat(" I WON ")
       }
       else
       {
         cat("  YOU ARE THE WINNER  ")
       }
    }
    flag <<- 1
  }
  else if (max(my_matrix[ ,b]) == min(my_matrix[ ,b]))
  {
    cat("TRIQUI\n")
    if (aut == 0){
       cat(sprintf("THE WINNER IS PLAYER %s", player))
    }
    else
    {
       if(player == 2)
       {
         cat(" I WON ")
       }
       else
       {
         cat("  YOU ARE THE WINNER  ")
       }
    }
    flag <<- 1
  }
  else if ((max(diag(my_matrix)) == min(diag(my_matrix)) & sum(diag(my_matrix)) != 0))
  {
    cat("TRIQUI\n")
    if (aut == 0){
       cat(sprintf("THE WINNER IS PLAYER %s", player))
    }
    else
    {
       if(player == 2)
       {
         cat(" I WON ")
       }
       else
       {
         cat("  YOU ARE THE WINNER  ")
       }
    }
    flag <<- 1
  }
  else if (max(second) == min(second) & sum(second) != 0)
  {
    cat("TRIQUI\n")
    if (aut == 0){
       cat(sprintf("THE WINNER IS PLAYER %s", player))
    }
    else
    {
       if(player == 2)
       {
         cat(" I WON ")
       }
       else
       {
         cat("  YOU ARE THE WINNER  ")
       }
    }
    flag <<- 1
  }
  else
  {
    if (min(my_matrix) != 0)
    {
      cat("NO WINNERS TRY AGAIN\n")
      flag <<- 0
    }
    else
    {
      flag <<- 0
      return()
    }
  }
}


# This is code to play TicTacToe with 1 o 2 players
# program start here
cat("Welcome to TicTacToe in R Language\n")
cat("Please choose 1 player or 2 players\n")
aut <- "global"
aut <- 1
players <- readLines("stdin", 1)
cat(sprintf("You choose: %s\n", players))
my_matrix <- "global"
my_matrix <- matrix(data=0, nr=3, nc=3)
flag <- "global"
flag <- 0
while (players > 2)
{
  cat("Choose only 1 or 2 players\n")
  players <- readLines("stdin", 1)
  cat(sprintf("You choose, %s\n", players))
}
if (players == 1) {
  a = two_players()
} else {
  aut <- 0
  a = two_players()
}
