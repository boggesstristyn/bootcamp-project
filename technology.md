# Technologies Used


## Data Cleaning and Analysis
Our initial data sources are:
- Austin Police Department Crime Data CSV: https://data.austintexas.gov/Public-Safety/Crime-Reports/fdj4-gpfu
- Austin Housing Market Analysis Data by Zip Code CSV: https://data.austintexas.gov/Housing-and-Real-Estate/2014-Housing-Market-Analysis-Data-by-Zip-Code/hcnj-rei3
- City of Austin Housing and Planning Displacement Risk Areas CSV: https://data.austintexas.gov/Locations-and-Maps/Displacement-Risk-Areas-2019/rbpe-nc57
- City of Austin Housing and Planning Displacement Risk Demographics CSV: https://data.austintexas.gov/Locations-and-Maps/Displacement-Risk-Demographics-2019/ynwn-mw2fWe intend to use MongoDB as our database. We have manually saved the Austin Housing Market Analysis, Displacement Risk Areas, and 
## Database Storage
Displacement Risk Demographics csv files, but as the APD Crime dataset is updated daily and contains over 2 million unique rows, we choose to use an API for this source. The database will connect to the data.austin.gov API and filter for incidents with occurrence dates later than 01/01/2014 and limiting the results to 10,000. If we find that our machine learning model could benefit from more data, we can easily edit these parameters. Using MongoDB will allow our database more flexibility compared to a SQL or SQLite database. Flask-pyMongo will be used to bridge Flask and MongoDB.


## Machine Learning
 To create our machine learning algorithm, we intend to use Python and the NumPy, SciPy, Scikit-learn, and Matplotlib.pylot libraries. 
 The benefits of making Python the perfect solution for machine learning and AI-driven projects include simplicity and consistency, flexibility, access to powerful AI
  and machine learning (ML) libraries and frameworks, platform independence, and large communities. We will use NumPy because NumPy is a library for the 
  Python programming language, adding support for large, multi-dimensional arrays and matrices, along with a large collection of high-level mathematical functions to operate on these arrays. 
  Using SciPy will enable us to  perform powerful image manipulations that are often used in the preprocessing step of several Machine Learning applications.
  Using Scikit-learn will provide a wide selection of supervised and unsupervised learning algorithms. Finally using Matplotlib.pylot libaries because
   Matplotlib is a very popular Python library for data visualization.

## Dashboard
We intend to use Flask and Bootstrap’s features to build our dashboard. Since a couple of our datasets include longitude/latitude/zip code variables, we would like to build an interactive map that would allow the user to either enter their desired filter features and highlights on the map the areas that meet those filter specifications, or a map that allows the client to click on zip codes and presents them with a pop-up with information pertaining to that zip code (ex: median household income, population below poverty level, household size, crime rate).  We also intend to use CSS to customize and D3 to add interactivity. The dashboard will be hosted on GitHub Pages.