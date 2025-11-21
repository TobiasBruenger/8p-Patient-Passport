library(rmarkdown)
library(tidyverse)

#TO BE MODIFIED for every set of passport #####
#dataset that contains the actual 8p heroes for who a passport shall be generated. Note that a passport will be generated for every individual in this dataframe. 
hero_data = "Input/Individual_example.txt"

#Reference dataset for the comparison group
reference_data = "Input/Reference_example.txt"

# Specify location to save passports 
passport_path <- "Output/Patient_passport_"

#MODIFICATION ENDS #####


# Define the values for `i` and corresponding custom names
df <- read_delim(hero_data, delim = "\t") 
values_i <- 1:nrow(df)
output_names <- paste0(passport_path, df$`Participant ID`, ".pdf") 

# Loop through each value of `i`
for (j in seq_along(values_i)) {  
  print(j)
  rmarkdown::render(
    input = "generate_individual_passport.Rmd", 
    output_file = output_names[j], 
    params = list(i = values_i[j],
                  hero_data = hero_data, # Pass the hero data
                  reference_data = reference_data) # Pass the reference data) 
  )
}

