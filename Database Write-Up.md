# Database

During this phase of the project, created the databases using the three source csv files. You can find these in the Cleaning file.

1. crime_reports_cleaning.ipynb
2. displacement_risk_cleaning.ipynb
3. housing_cleaning.ipynb

Within each database we cleaned the columns and checked the data types. After cleaning, we were able to create dataframes. Once the dataframes were established, we imported SQLite to our code and created tables in SQL. For example, below is the connection for our crime reports. This was replicated for both the displacement risk database connection and the house cleaning database connection. 

![Alt Text](https://github.com/boggesstristyn/bootcamp-project/blob/Database/Database%20Connection.png)

Once connected, we were able to merge the crime reports data with the displacement risk by the census tract column. First we grouped and counted the number of crime reports per censust tract. Once this was completed, we are able to join the tables via an inner join since we are looking for displacement risk within each census tract, in relation to crime. We are also able to merge the housing data with the reports data by zipcode. All other columns will be summed or counted based on the data types.

