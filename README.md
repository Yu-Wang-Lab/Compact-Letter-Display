The file named mango is the cleaned-up data. The R script looks for this file name so change as needed.

If trying to use script in future work, the CSV file will need to be constructed in the same format as mango.csv.
The first column should be cultivar name (species name), the next columns should be the chemicals of interest.
If replicating, the future data needs to be the same format as the data in this file.
As an example, let's say you have 3 biological replicates (BR) and 3 technical replicates (TR) for each.
You should remove the TR information and leave the BR information in the dataframe.
The data should be converted as follows.

Glenn BR1 TR1 ---> Glenn BR1
Glenn BR1 TR2 ---> Glenn BR1
Glenn BR1 TR3 ---> Glenn BR1
Glenn BR2 TR1 ---> Glenn BR1

In addition, there may be some issues if the titles of columns have any special characters in them. Things such as:
blank spaces, parenthesis, commas, mathematical symbols (+, -, etc.), slashes, and maybe periods.
Simply edit those from the data set in the csv by using ctrl+h to convert to something or to delete them.

The R script will look for a csv datafile, import that data, and generate a list of chemicals from the column names.
From this generated list, the compact letter display (cld) will be generated for each chemical individually. You
will have to manually transcribe the results at this time.

Output
The output will show each species and assign a cld to each group. If all species are labeled as 'a' then they are 
statistically similar. If they are in differing groups (for example, group 'a' for one species and group 'b' for another)
then these would be considered statistically different groups. Results example below: Glenn and Saigon are statistically
similar. Mamme is statistically different than both Glenn and Saigon

> $X2.C.methyl.D.erythritol.4.phosphate
>  Glenn  Mamme Saigon 
>    "a"    "b"    "a" 

If unsure please check

> help(cld)
> help(multcomp)

for more information.
