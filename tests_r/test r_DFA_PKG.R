require("DFA")

# define time windows scales
tws <- c(4, 5, 7, 9, 11, 13, 16, 20, 23, 28, 33,
         38, 45, 52, 60, 69, 79, 91, 104, 119,
         135, 154, 174, 198, 223, 252, 285, 321,
         362, 407, 457, 513, 575, 645, 723, 809,
         905, 1011, 1130, 1261, 1407, 1570)

print(length(tws))

# read data
data <- read.csv("https://tinyurl.com/zbtestdata01")

# extract series
f3 <- data[, c("F3")]
f6 <- data[, c("F6")]

print("Start")
start_time <- Sys.time()

rhoDCCA(f3, f6, scale = "F", box_size = tws)

end_time <- Sys.time()

# print recorded time
print("DFA_PKG result: ")
print(end_time - start_time)
