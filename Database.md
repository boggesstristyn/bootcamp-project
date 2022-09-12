### Database

For our final group project, we are analyzing crime rates in Austin while also looking at housing market trends and displacement risk. We have created a provisional database in csv file format that we sourced from the City of Austin open data portal. This database contains over 2.9 million rows of data. We also sourced the Austin housing market data (37 rows of data).

Austin Police Department Crime Data CSV: https://data.austintexas.gov/Public-Safety/Crime-Reports/fdj4-gpfu

Austin Housing Market Analysis Data by Zip Code CSV: https://data.austintexas.gov/Housing-and-Real-Estate/2014-Housing-Market-Analysis-Data-by-Zip-Code/hcnj-rei3

City of Austin Housing and Planning Anti-Displacement Data CSV: https://data.austintexas.gov/Housing-and-Real-Estate/Project-Connect-Anti-Displacement-Dashboard-Data-2/e2tx-ut3v*

For the mock-up, we were able to create an SQL database using the crime data csv file and Austin housing market csv file. We connected the two datasets by zipcode as the foreign key. From this we created two tables in PostgreSQL (in Database File file). 

Please note that this is provisional and that throughout the project, the datasets will likely require a lot of cleaning in regards to columns that are not needed for our project and finding common variables to link the multiple datasets by for our database creation. We intend to use the Displacement Risk Demographics dataset for our machine learning algorithm, so we will need to determine which variables will be the most helpful for our model, as for the provisional database we had not yet determinted the data that could merge to the Crime data and Austin housing market datasets. 

![Alt Text](https://github.com/boggesstristyn/bootcamp-project/blob/Lauren/Database%20File/ERD%20Database.png)
