# Austin Gentrification

## Overview

### Purpose

#### As cities grow and change, citizens and businesses have to adapt to these changes. While gentrification can be seen as a way of bringing in new and refreshed life into an already established neighborhood or city by some, it is best defined as the "process in which a poor area experiences an influx of middle-class or wealthy people who renovate and rebuild homes and business and which often results in an increase in property values and the displacement of earlier, usually poorer residents" [1]. As our group comprises of mostly Austin natives, we chose to focus on the impact of population growth and gentrification in Austin, TX. 

#### Austin has experienced rapid growth in recent years and the impacts of gentrification can be seen across the city. Taller mixed-use buildings are being built throughout the city, no longer focused primarily downtown. Home prices have jumped dramaticially across the city, nearly tripling since 2011 with the median home price reaching a high of $667,000 May of this year [2]. Median rent has also increased over 40% over the past year, the greatest increase in median rent for any US metropolitan area [3]. 

#### To meet the increasing demand for housing, Austin's City Council has reviewed regulations pertaining to new building height limits next to existing single-family homes [4], updating vertical mixed-use (VMU) buildings' height allowances and affordability requirements [4], and rezoning/upzoning requests [5]. A growing side effects of these changes is the displacement of current residents when they can no longer afford the rising prices. 

#### But what metrics make a neighborhood more suscepitable to displacement caused by gentrification? This is the main question we explore in our analysis of demographic statistics and crime reports data. Our goals is to determine which metrics are most influencial in determining if an area is vulnerable to genetrification risk and implenting those metrics into a machine learning model that could be applied to other cities. As long as a city can collect basic census metrics like race, income, education, and housing data, the model could be applied. 

### Questions
1. In regards to displacement risk, what are the most relevant demographic metrics?
2. With these metrics, is it possible to accurately predict if a population is vulnerable to gentrification? 
3. Is there a relationship between gentrification and crime rates?
4. Are crime rates higher in areas with greater displacement risk?
5. Are vulnerable neighborhoods focused in one area or spread across the city? 

### Members
- Carina Diaz
- Carlos Uroza
- Tristyn Boggess
- Lauren Rishel
- Fardeen Siddiqui

## Resources

### Data
- [Austin Crime Reports](https://data.austintexas.gov/Public-Safety/Crime-Reports/fdj4-gpfu)
- [City of Austin Housing and Planning Anti-Displacement Data](https://data.austintexas.gov/Housing-and-Real-Estate/Project-Connect-Anti-Displacement-Dashboard-Data-2/e2tx-ut3v)
- [Austin Housing Market Analysis Data](https://data.austintexas.gov/Housing-and-Real-Estate/2014-Housing-Market-Analysis-Data-by-Zip-Code/hcnj-rei3)

#### Data was collected from data.austintexas.gov. The Austin Crime Reports is updated on a weekly basis, providing us the most up to date Austin Police Department incident reports. The Anti-Displacement dataset was prepared by researchers at the University of Texas to examine displacement risk in different areas of Austin. The Housing Market dataset was prepared for the City of Austin's 2014 Comprehensive Housing Market Analysis Report. 

### Software
- Jupyter Notebook
- Pandas
- SQLite
- Tableau

### Requirements

## Database

#### To explore and clean our data, we used Python and the Pandas library via Jupyter Notebook. The Displacement dataset was saved as a CSV directly from the data.austintexas.gov website, while the Crime dataset was collected via an API call to limit the over 2.39 million incident report entries. Exploratory analysis was performed by examining unique column values, grouping data by zip codes and census tract, and generating descriptive statistics for columns we initially thought would have the most impact on our machine learning model. The remainder of our exploration was in the form of preprocessing the data for our multiple machine learning model tests. 

#### Once we were done creating and cleaning our dataframes, we initiated a SQLite connection to establish our "gentrification_db" database. With the database created, we then used the to_sql function to create the tables and connect to the newly established database. To ensure that our data was properly imported to the SQLite tables, we called each table into a new dataframe in Python to continue to work with for our machine learning component. While a table was creaking for the housing market data, we did not utilize it for our final project analysis. 

## Machine Learning Model

### Preliminary Data Preprocessing
- Encoded "VULNERABLE Pop" column to use as dependent variable.
- Encoded "GENTRIFICATION Typology", "DEMOGRAPHIC Change", "HOUSING_MARKET", "DISPLACEMENT RISK" columns to use as independent variables.
- Segmented "VULNERABLE Pop" column for use as the target (dependent) variable and removed it from the DataFrame.
- Standardized X_train and X_test datasets using StandardScaler.

### Preliminary feature engineering, preliminary feature selection, and decision-making process
- We decided to use the "VULNERABLE Pop" column as our dependent variable as it provides a simple Boolean output we can model with our Logistic Regression model.
- Upon testing our Random Forest model, we were able to produce a feature importance list using the feature_importances_ function. This list will help us determine which features to remove in order to avoid overfitting our model.
- If we had more time, we would perform an outlier analysis for each of our 37 features in order to determine if further preprocessing is needed.

### Description of how data was split into training and testing sets
- Data was split using train_test_split before standardizing the data. We will be using the same standardized training and testing sets for both of our models in order to compare the performance of the models on an equal basis.

### Explanation of model choice, limitations, and benefits
#### Logistic Regression Model
- We chose a simple Logistic Regression since our "VULNERABLE Pop" dependent variable provides a simple Boolean output that could be accurately modeled through logistic regression.
- A benefit of starting our analysis with a logistic regression is that it will serve as a basic benchmark to test the performance of additional models and optimization options.
- The main current limitation of our both our models is it seems the models are re-creating the classifier that created the "VULNERABLE Pop" column. This is supported by a correlation analysis of our full DataFrame which shows none of our features are perfectly correlated to our dependent variable. As a result, our model is currently producing 100% accuracy results.

#### Random Forest Model
- We chose a basic Random Forest classifier as ensemble models are capable of handling datasets with many features. Our training dataset contains approximately 37 features across over 2200 rows.
- A benefit to testing a Random Forest model is it allows us to determine a feature importance list from which can be used to inform the feature reduction process.
- This model is also currently producing 100% accuracy results.

## Dashboard

#### [Link]() to Tableau dashboard. 

## Presentation

#### [Link]() to Google Slides presentation. 

## Results

### 


![Screen Shot 2022-09-18 at 20 16 42](https://user-images.githubusercontent.com/103851131/190938544-586e28ff-bc2d-4c32-a845-641884071422.png)

 - Showing the number of crime reports over the last four years.

![Screen Shot 2022-09-22 at 20 44 02](https://user-images.githubusercontent.com/103851131/191878450-65056ac6-0006-481b-b8fb-60fa75a39f21.png)

- In continuation of the crime rates over time, we can see that the top five crimes are theft, various burglaries, family disturbances, assault, and criminal conspiracy.

<img width="642" alt="Screen Shot 2022-09-18 at 21 44 57" src="https://user-images.githubusercontent.com/103851131/190942302-ecd81101-dcd5-4313-b0c2-ecb1be1c8ece.png">

- Beginning stage of mapping crime in relation to various areas.







## Sources

[1] https://www.merriam-webster.com/dictionary/gentrification

[2] https://austin.culturemap.com/news/real-estate/06-22-22-city-of-austin-home-price-667000-housing-inventory-grows/

[3] https://www.washingtonpost.com/business/2022/01/30/rent-inflation-housing/

[4] https://communityimpact.com/austin/central-austin/2022/07/22/austin-bets-on-bigger-development-along-corridors-amid-ongoing-housing-crisis/

[5] https://www.bloomberg.com/news/features/2022-04-29/as-gentrification-sweeps-austin-zoning-reform-remain-elusive
