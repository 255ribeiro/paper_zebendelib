require(combinat)
require("DCCA")
# define time windows scales
tws <- c(4, 5, 7, 9, 11, 13, 16, 20, 23, 28, 33,
         38, 45, 52, 60, 69, 79, 91, 104, 119,
         135, 154, 174, 198, 223, 252, 285, 321,
         362, 407, 457, 513, 575, 645, 723, 809,
         905, 1011, 1130, 1261, 1407, 1570)
print("Number of time windows scales:")
print(length(tws))
data <- read.csv("https://tinyurl.com/zbtestdata01")# load data
dcca_of <- combn(4, 2)
result_DCCA_PKG <- list()
start_time <- Sys.time()
for(i in 1:dim(dcca_of)[2]){
  s1 <- data[[ dcca_of[, i][1]]]
  s2 <- data[[ dcca_of[, i][2]]]
  print(c(dcca_of[, i][1], dcca_of[, i][2]))

  temp <- rhodcca(s1, s2, m = tws, nu = 1, overlap = TRUE)
  result_DCCA_PKG <- append(result_DCCA_PKG, temp, 
                            after = length(result_DCCA_PKG))
}
end_time <- Sys.time()
print("elapsed time:")
elapsed_DCCA_PKG <- end_time - start_time
print(elapsed_DCCA_PKG)