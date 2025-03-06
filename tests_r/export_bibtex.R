# Load the knitr package
library(knitr)

# Specify the packages you want to include in the BibTeX file
packages <- c("DCCA", "DFA")

# Generate a BibTeX file for the specified packages
write_bib(x = packages, file = "selected_packages.bib")

# Print a message indicating the file has been created
cat("BibTeX file 'selected_packages.bib' has been created.\n")