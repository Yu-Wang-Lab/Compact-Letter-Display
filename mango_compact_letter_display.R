###############################################################################
#                                                                             #
#                         Compact Letter Display                              #
#                   Please use the read_me.txt for help                       #
#                                                                             #
###############################################################################

# Must have in-order to perform the tests.
if (!require('multcomp')) install.packages('multcomp'); library('multcomp')

# Loading in the data                    #########################################
desired_data = read.csv('mango.csv')     # Change the name of the data file here.#
                                         #########################################

responseList = names(desired_data)[-1]     # Generating a list of chemical names.

# Taking the anova of all chemicals in the chemical names list.
desired_data$Species = as.factor(desired_data$Species)     # The species must be a factor for this to work.
modelList = lapply(responseList, function(resp){
  mF = formula(paste(resp, '~ Species'))
  aov(mF, data = desired_data)
})

# Applying a tukey test to all chemical anovas.
data_tukey_all = lapply(modelList, glht, linfct = mcp(Species = 'Tukey'))

# Generating a compact letter display output for all chemicals between the species.
data_cld_all = lapply(data_tukey_all, cld)
names(data_cld_all) <- c(responseList)     # Naming the list to have all chemicals.
print(data_cld_all)


###############################################################################


###### Performing the anova test between the species of the mangoes.
###### This method is sufficient if you are trying to do one chemical specifically.
###### I used this to double check work. Feel free to as well. Change names as needed.

#desired_data$Species = as.factor(desired_data$Species)
#data_aov = aov(Pyruvic_acid ~ Species, data = desired_data)     # Change Pyruvic_acid to desired response variable.
#data_tukey = glht(data_aov, linfct = mcp(Species = 'Tukey'))
#cld(data_tukey)


