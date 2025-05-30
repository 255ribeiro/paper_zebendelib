require(combinat)
require("DFA")
series_count <- 4 # select the number of series to run
# define time windows scales
tws <- c(4, 5, 7, 9, 11, 13, 16, 20, 23, 28, 33,
         38, 45, 52, 60, 69, 79, 91, 104, 119,
         135, 154, 174, 198, 223, 252, 285, 321,
         362, 407, 457, 513, 575, 645, 723, 809,
         905, 1011, 1130, 1261, 1407, 1570)
cat("Number of time windows scales: ", length(tws), "\n")
data <- read.csv("https://tinyurl.com/zbtestdata64c")# load data
data <- data[, 1:series_count] # filter columns
start_time <- Sys.time() # time stamp
dcca_of <- combn(c(1:series_count), 2)
cat("Number of series: ", length(data), "\n")
for (i in seq_len(dim(dcca_of)[2])){
  s1 <- data[[dcca_of[, i][1]]] # selecting first series
  s2 <- data[[dcca_of[, i][2]]] # selecting second series
  cat("Series: ", dcca_of[, i][1], " and ", dcca_of[, i][2], "\n")
  rhoDCCA(s1, s2, scale = "F", box_size = tws) # Pdcca calculations
}
end_time <- Sys.time() #end time stamp
elapsed_dfa_pkg <- end_time - start_time #elapsed time
cat("elapsed time: ", elapsed_dfa_pkg, "\n")