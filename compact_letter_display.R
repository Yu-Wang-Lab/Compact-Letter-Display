###############################################################################
#                                                                             #
#                         Compact Letter Display                              #
#                   Please use the read_me.txt for help                       #
#                                                                             #
###############################################################################

#### Make sure you are in the right directory. ###


# Must have in-order to perform the tests.
if (!require('multcomp')) install.packages('multcomp'); library('multcomp')

# Loading in the data                    #########################################
desired_data = read.csv('Example_data.csv')     # Change the name of the data file here.#
                                         #########################################

# Convert "Species" to a factor
desired_data$Species <- as.factor(desired_data$Species)
# Generate a list of names to be tested with ANOVA.
measurements = names(desired_data)[-1]     # "Species" must be in the first column.

# Loop through each measurement
for (measure in measurements) {
  # Create the formula
  formula <- as.formula(paste(measure, "~ Species"))
  
  # Perform one-way ANOVA
  model <- aov(formula, data = desired_data)
  
  # Perform pairwise comparisons
  comp <- glht(model, linfct = mcp(Species = "Tukey"))
  
  # Create compact letter display
  cld_results <- cld(comp)
  
  # Print the results
  cat(paste("Compact letter display for", measure, ":\n"))
  print(cld_results)
  cat("\n")
}


###############################################################################


###### Performing the anova test between the species of the mangoes.
###### This method is sufficient if you are trying to do one chemical specifically.
###### I used this to double check work. Feel free to as well. Change names as needed.

#desired_data$Species = as.factor(desired_data$Species)
#data_aov = aov(Pyruvic_acid ~ Species, data = desired_data)     # Change Pyruvic_acid to desired response variable.
#data_tukey = glht(data_aov, linfct = mcp(Species = 'Tukey'))
#cld(data_tukey)


