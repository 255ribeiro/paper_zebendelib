require(combinat)
require("DCCA")
# define time windows scales
tws <- c(4, 5, 7, 9, 11, 13, 16, 20, 23, 28, 33,
         38, 45, 52, 60, 69, 79, 91, 104, 119,
         135, 154, 174, 198, 223, 252, 285, 321,
         362, 407, 457, 513, 575, 645, 723, 809,
         905, 1011, 1130, 1261, 1407, 1570)
cat("Number of time windows scales: ", length(tws), "\n")
series_count <- 12 # select the number of series to run 
data <- read.csv("https://tinyurl.com/zbtestdata64c")# load data
data <- data[, 1:series_count] # filter columns
start_time <- Sys.time() # start time stamp
dcca_of <- combn(c(1:series_count), 2)
cat("Number of series:", length(data), "\n")
result_DCCA_PKG <- list()
for(i in 1:dim(dcca_of)[2]){
  s1 <- data[[ dcca_of[, i][1]]] # selecting first seires
  s2 <- data[[ dcca_of[, i][2]]] # selecting second seires
  temp <- rhodcca(s1, s2, m = tws, nu = 1, overlap = TRUE) # Pdcca calculations
  result_DCCA_PKG <- append(result_DCCA_PKG, temp,
                            after = length(result_DCCA_PKG)) # collecting results
}
end_time <- Sys.time() #end time stamp
elapsed_DCCA_PKG <- end_time - start_time #elapsed time
cat("elapsed time: ", elapsed_DCCA_PKG, "\n")