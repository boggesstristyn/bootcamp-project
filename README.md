# Austin Gentrification

## Overview

### Purpose

#### As cities grow and change, citizens and businesses have to adapt to changes caused by gentrification. While gentrification can be seen as a way of bringing in new and refreshed life into an already established neighborhood or city by some, it is best defined as the "process in which a poor area experiences an influx of middle-class or wealthy people who renovate and rebuild homes and business and which often results in an increase in property values and the displacement of earlier, usually poorer residents" [1]. As our group comprises of mostly Austin natives, we chose to focus on the impact of population growth and gentrification in Austin, TX. 

#### Austin has experienced rapid growth in recent years and the impacts of gentrification can be seen across the city. Taller mixed-use buildings are being built throughout the city, no longer primarily limited to downtown. Home prices have jumped dramaticially across the city, nearly tripling since 2011 with the median home price reaching a high of $667,000, as of May of this year [2]. Median rent has also increased over 40% over the past year, the greatest increase in median rent for any US metropolitan area [3]. 

#### To meet the increasing demand for housing, Austin's City Council has reviewed regulations pertaining to new building height limits next to existing single-family homes [4], updating vertical mixed-use (VMU) buildings' height allowances and affordability requirements [4], and rezoning/upzoning requests [5]. A growing side effect of these changes is the displacement of current residents where they can no longer afford the rising prices. 

#### But which metrics make a neighborhood more suscepitable to displacement caused by gentrification? This is the main question we explore in our analysis of demographic statistics and crime reports data. Our goals are to analyze which metrics are most influencial in determining if an area is vulnerable to genetrification risk and implementing those metrics into a machine learning model that could be applied to other cities. As long as a city can collect basic census metrics like race, income, education, and housing data, the model could be applied. 

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
- Sklearn
- Matplotlib
- SQLite
- Tableau

### Requirements

#### [Link](https://github.com/boggesstristyn/bootcamp-project/blob/main/Resources/requirements.txt) to requirements.txt file. 

## Database

#### To explore and clean our data, we used Python and the Pandas library via Jupyter Notebook. The Displacement dataset was saved as a CSV directly from the data.austintexas.gov website, while the Crime dataset was collected via an API call to limit the over 2.39 million incident report entries. Exploratory analysis was performed by examining unique column values, grouping data by zip codes and census tract, and generating descriptive statistics for columns we initially thought would have the most impact on our machine learning model. The remainder of our exploration was in the form of preprocessing the data for our multiple machine learning model tests. 

#### Once we were done creating and cleaning our dataframes, we initiated a SQLite connection to establish our "gentrification_db" database. With the database created, we then used the to_sql function to create the tables and connect to the newly established database. To ensure that our data was properly imported to the SQLite tables, we called each table into a new dataframe in Python to continue to work with for our machine learning component. While a table was creaking for the housing market data, we did not utilize it for our final project analysis. 

## Machine Learning Model

### Preliminary Data Preprocessing
		1. Dropped unnecessary (Names, GeoIDs, etc) and redundant (Percent without Bachelors, etc) columns. Total of 38 columns dropped.
		2. Dropped rows with missing data using dropna.
		3. Encoded categorical columns: “VULNERABLE Pop”
		4. Standardized X_train and X_test datasets using StandardScaler.
		5. Tested response variable (y_train) for class imbalance.

### Preliminary feature engineering, preliminary feature selection, and decision-making process
- Chose "VULNERABLE Pop" as our dependent variable because it provides a simple Boolean output we can model with a Logistic Regression model.
- Using a Random Forest model, we were able to produce a feature importance list using the feature_importances_ function. This list helped us to determine which features to remove in order to avoid overfitting our model.
- Upon testing our first model, our accuracy scores were 100% and we realized we were likely overfitting the model. We then performed a Correlation Analysis to determine which variables were most correlated to our predictions and removed all remaining non-census variables from the model.

### Description of how data was split into training and testing sets
- Data was split using train_test_split before standardizing the data. 
- We will be using the same standardized training and testing sets for all of our models in order to compare the performance of the models on an equal basis.

### Explanation of model choice, limitations, and benefits
#### Logistic Regression Model
- Choice
	- We choose to begin with this model since our dependent variable, "VULNERABLE Pop", provides a simple Boolean output that could be accurately modeled with a Logistic Regression.
- Limitations
	- The main limitation of our both our models is it seems the model is re-creating the classifier that created the "VULNERABLE Pop" column. This is supported by a correlation analysis of our full DataFrame which shows none of our features are perfectly correlated to our dependent variable.
	- This model had trouble converging with a smaller number of iterations, we had to increase our max_iterations = 2000 for the model to converge.
- Benefit
	- A benefit is that it will serve as a basic benchmark to test the performance of additional models and optimization options.

#### SVC Model
- Choice
	- We choose an SVM model since this is a ML Method specifically meant for binary classification.
- Limitations
	- Not the best for noisy data. This is important to us since did not test for outliers. If we had more time, we would have tested our features for outliers.
- Benefit
	- Main benefit is SVC have less overfitting issues over smaller datasets.

#### Random Forest Model
- Choice
	- We choose an RF model as it can be used on non-linear data. This is useful to us as not all of our features are clearly linear.
	- We also needed to create a feature importance list for our feature re-selection process.
- Limitations
	- Long processing time and resource intensive. The RF notebook took my PC about 12 mins to run.
- Benefit
	- Resulted in 100% accuracy score even after re-selection of our features.

### Explanation of changes in model choice (if changes occurred between the Segment 2 and Segment 3 deliverables)
In our first round of preprocessing, we only removed the unnecessary and redundant columns. This left many categorical variables in our model that were created by the researchers who compiled our dataset. Upon encoding our dataset, this yielded a total of 37 features. A large portion of these had strong correlations with our target variable. As a result, our model was already producing 100% accuracy results.

### Description of how model was trained (or retrained, if they are using an existing model)
We decided to remove all of the researcher created variables and see if we could recreate the results of the study using only census and housing data. This reduced our dataset to a total of 22 features. Since this information should be more readily available than the researcher’s metrics, it should be possible to retrain our model on other cities as well. 

### Description and explanation of model’s confusion matrix, including final accuracy score
Our most accurate model after retraining was our Basic Random Forest model. This model achieved a recall and precision of 1.0. In contrast our SVC model resulted in a marginal improvement over the Logistic Regression model in terms of recal, precision, and accuracy. We used balanced accuracy scores to provide a fair comparison of all models' results.

#### Basic Logistic Regression Model

![Logistic_Models_Results](https://user-images.githubusercontent.com/103288980/193155346-ff7569db-1ba7-4699-9c5d-d9b8c67edfc5.PNG)

![BasicLogistic_ConfusionMatrix](https://user-images.githubusercontent.com/103288980/193155303-33b93671-f30e-4b97-befc-65ba344e5bc5.PNG)

![BasicLogistic_ClassificationReport](https://user-images.githubusercontent.com/103288980/193155314-0fe763d3-6915-44c7-ab6d-48680a55d048.PNG)

#### Basic SVC Model

![SVC_Models_Results](https://user-images.githubusercontent.com/103288980/193155391-c8682fa6-12ff-4c6a-82c1-46e494448f29.PNG)

![BasicSVM_ConfusionMatrix](https://user-images.githubusercontent.com/103288980/193155443-48592e85-09bf-4d3c-b7b5-7b4ea83471a9.PNG)

![BasicSVM_ClassificationReport](https://user-images.githubusercontent.com/103288980/193155471-03d1dcfc-36f3-4a42-a254-543c613162cf.PNG)

#### Basic Random Forest Model

![RF_Models_Results](https://user-images.githubusercontent.com/103288980/193155380-d824748a-b327-432f-b974-7869b16c25bc.PNG)

![BasicRF_ConfusionMatrix](https://user-images.githubusercontent.com/103288980/193155489-e874137a-a825-4466-beb0-7a2085970130.PNG)

![BasicRF_ClassificationReport](https://user-images.githubusercontent.com/103288980/193155508-41414e28-63a5-40dc-b69c-51dec326021e.PNG)

## Dashboard

#### [Link](https://public.tableau.com/app/profile/carina.diaz/viz/AustinGentrification_Dashboard/Dashboard1) to Tableau dashboard. 

![dashboard.PNG](https://github.com/boggesstristyn/bootcamp-project/blob/main/Images/dashboard.PNG)

## Presentation

#### [Link](https://docs.google.com/presentation/d/1-TiG67iIzo5gKKd23wOaXQg1TtN5CmG_sfSwT-wCHaw/edit) to Google Slides presentation. 

## Results

#### Utilizing the displacement risk table for our machine learning model, we wanted to determine if a model could accurately predict if an area's population is vulnerable to displacement caused by gentrification with a YES or NO result. As this dataset was created by UT researchers and included variable columns that were most likely generated by the researchers for the purpose of this displacement study, we knew we would need to remove quite a few variables to avoid overfitting our model to the dataset. By limiting the independent features to census metrics like poverty level, income, education level, race, and housing occupancy, we were able to create a Random Forest model with 100% accuracy. Using the Random Forest Model also allowed us to sort the features by their importance, finding that "Population below poverty" held the highest importance to the model. Understandably so, if an area has a large portion of its population that lives below poverty, they could more likely be displaced from their homes if they cannot meet costs. Other features of high importance were income and education level. Features of low importance were housing occupancy/vacancy and race. 

#### Regarding our initial questions, we were able to answer most. We were able to find the most relevant metrics to determining displacement vulnerability through our Random Forest model's feature_importances_ array seen below. We were also able to obtain a 100% accuracy score with this model. We hope that by limiting the independent features to census collected metrics, this model could be applied to other cities. While every city has its own history as to why certain areas may be more vulnerable to displacement than others, such as Austin’s 1928 Master Plan that created a “Negro District” east of IH-35 and still has impacts today [6], this model could be a good baseline measure to determining vulnerability in other large metropolitan cities. 

#### We were also able to map our displacement and crime tables, independently, to visualize where vulnerable neighborhoods and crimes are concentrated (see Dashboard). Our visuals show a distinct separation of vulnerable neighborhoods to the east and non-vulnerable to the west, as well as higher incident report counts on the east side (apart from Barton Creek Mall, the largest density bubble on the map). 

#### The main question we leave unanswered was whether there is a relationship between gentrification and crime. One of the biggest issues we ran into was how to merge our tables, as the displacement and crime datasets both included Census Tract info, but in varying forms that would make it difficult to join on. Additional time could have been used to transform the Census Tract columns by using regular expressions to then join the tables on. Being able to join on census tract would also open up the possibility of joining other datasets that contain a census tract column with the displacement dataset. This would allow us to compare how other independent vairables influence our model's performance. 

![crime_over_time.png](https://github.com/boggesstristyn/bootcamp-project/blob/main/Images/crime_over_time.png)

 - Showing the number of crime reports over the last four years.

![crimes_by_type.png](https://github.com/boggesstristyn/bootcamp-project/blob/main/Images/crimes_by_type.png)

- In continuation of the crime rates over time, we can see that the top five crimes are theft, various burglaries, family disturbances, assault, and criminal conspiracy.

![FeaturesCorrelation.PNG](https://github.com/boggesstristyn/bootcamp-project/blob/main/Images/FeaturesCorrelation.PNG)

- Initial implenentation of Random Forest Model with all independent variables. Removed features from this list due to high correlations and overfitting to the dataset. 

![FeaturesImportance.PNG](https://github.com/boggesstristyn/bootcamp-project/blob/main/Images/FeaturesImportance.PNG)

- Random Forest model's independent features ranked by importance. 

![ROC Curve for Basic SVM Model](https://user-images.githubusercontent.com/103288980/192428270-2fcf7f52-87c7-4de9-ae2a-1838a0a4ee07.PNG)

- Our ROC Curve of our Basic SVM Model resulted in an Area Under the Curve value of 0.996



## Sources

[1] https://www.merriam-webster.com/dictionary/gentrification

[2] https://austin.culturemap.com/news/real-estate/06-22-22-city-of-austin-home-price-667000-housing-inventory-grows/

[3] https://www.washingtonpost.com/business/2022/01/30/rent-inflation-housing/

[4] https://communityimpact.com/austin/central-austin/2022/07/22/austin-bets-on-bigger-development-along-corridors-amid-ongoing-housing-crisis/

[5] https://www.bloomberg.com/news/features/2022-04-29/as-gentrification-sweeps-austin-zoning-reform-remain-elusive

[6] https://projects.statesman.com/news/economic-mobility/ 
