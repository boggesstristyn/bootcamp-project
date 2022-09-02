# Technologies Used
## Data Cleaning and Analysis
Our initial data sources are:
- Austin Police Department Crime Data CSV: https://data.austintexas.gov/Public-Safety/Crime-Reports/fdj4-gpfu
- Austin Housing Market Analysis Data by Zip Code CSV: https://data.austintexas.gov/Housing-and-Real-Estate/2014-Housing-Market-Analysis-Data-by-Zip-Code/hcnj-rei3
- City of Austin Housing and Planning Displacement Risk Areas CSV: https://data.austintexas.gov/Locations-and-Maps/Displacement-Risk-Areas-2019/rbpe-nc57
- City of Austin Housing and Planning Displacement Risk Demographics CSV: https://data.austintexas.gov/Locations-and-Maps/Displacement-Risk-Demographics-2019/ynwn-mw2f

To explore and clean our data, we will use Python and the Pandas library. The crime dataset will likely require the most cleaning, as not all of the column variables will be necessary for our analysis and there are numerous incidents (rows) that have null values. We will most likely lose a significant amount of data with our cleaning, but with over 2.39 million incident entries, we may still need to apply a filter on the results to only include the most recent year’s data in our analysis. The remaining datasets will likely require more cleaning in regards to columns that are not needed for our project and finding common variables to link the multiple datasets by for our database creation. We intend to use the Displacement Risk Demographics dataset for our machine learning algorithm, so we will need to determine which variables will be the most helpful for our model. 

## Database Storage
We intend to use MongoDB as our database. Initially, we have manually saved the most recent CSV data from the source links, but we will most likely update this use an API to pull dataset by the end of the project.  Using MongoDB will allow our database more flexibility compared to a SQL or SQLite database. Flask-pyMongo will be used to bridge Flask and MongoDB.

## Machine Learning
To create our machine learning algorithm, we intend to use Python and the NumPy, SciPy, Scikit-learn, and Matplotlib.pylot libraries. 

## Dashboard
We intend to use Flask and Bootstrap’s features to build our dashboard. Since a couple of our datasets include longitude/latitude/zip code variables, we would like to build an interactive map that would allow the user to either enter their desired filter features and highlights on the map the areas that meet those filter specifications, or a map that allows the client to click on zip codes and presents them with a pop-up with information pertaining to that zip code (ex: median household income, population below poverty level, household size, crime rate).  We also intend to use CSS to customize and D3 to add interactivity. The dashboard will be hosted on GitHub Pages.