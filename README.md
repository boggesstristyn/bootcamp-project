# Austin Gentrification

## Topic

#### Cities grow and change, and citizens and businesses adapt to these changes. A concept for bringing new and refreshed life into a city can be called gentrification. More specifically, gentrification is the process of changing the character of a poor urban area through the influx of more well-off residents and upscale businesses. While gentrification can be seen as progress for some, the displacement of others can be negatively life altering.

#### As Austin, TX, experiences its own rapid growth and change, we can see families displaced and shifts in cultural comfort. Is there a correlation between gentrification and crime rates? Because we are mostly Austin locals, our group has decided to take an analytical look at gentrification and crime rates in these areas.

#### Are crime rates higher in areas with greater displacement risk?
- What is the relation between gentrification and crime?
- In regards to displacement risk, what is the most relevant demographic metric?
- Is it possible to predict if a population is vulnerable to gentrification or not?

## Data Sources

- Austin Police Department Crime Data CSV: https://data.austintexas.gov/Public-Safety/Crime-Reports/fdj4-gpfu 
- Austin Housing Market Analysis Data by Zip Code CSV: https://data.austintexas.gov/Housing-and-Real-Estate/2014-Housing-Market-Analysis-Data-by-Zip-Code/hcnj-rei3 
- City of Austin Housing and Planning Anti-Displacement Data CSV: https://data.austintexas.gov/Housing-and-Real-Estate/Project-Connect-Anti-Displacement-Dashboard-Data-2/e2tx-ut3v* 

## Machine Learning Model

### Preliminary Data Preprocessing
- Encoded "VULNERABLE Pop" column to use as dependent variable.
- Encoded "GENTRIFICATION Typology", "DEMOGRAPHIC Change", "HOUSING_MARKET", "DISPLACEMENT RISK" columns to use as independent variables.
- Segmented "VULNERABLE Pop" column for use as the target (dependent) variable and removed it from the DataFrame.
- Standardized X_train and X_test datasets using StandardScaler.

### Preliminary feature engineering and preliminary feature selection, including the decision-making process
- We decided to use the "VULNERABLE Pop" column as our dependent variable as it provides a simple Boolean output we can model with our Logistic Regression model.
- Upon testing our Random Forest model, we were able to produce a feature importance list using the feature_importances_ function. This list will help us determine which features to remove in order to avoid overfitting our model.
- If we had more time, we would perform an outlier analysis for each of our 37 features in order to determine if further preprocessing is needed.

### Description of how data was split into training and testing sets
- Data was split using train_test_split before standardizing the data. We will be using the same standardized training and testing sets for both of our models in order to compare the performance of the models on an equal basis.

### Explanation of model choice, including limitations and benefits
#### Logistic Regression Model
- We chose a simple Logistic Regression since our "VULNERABLE Pop" dependent variable provides a simple Boolean output that could be accurately modeled through logistic regression.
- A benefit of starting our analysis with a logistic regression is that it will serve as a basic benchmark to test the performance of additional models and optimization options.
- The main current limitation of our both our models is it seems the models are re-creating the classifier that created the "VULNERABLE Pop" column. This is supported by a correlation analysis of our full DataFrame which shows none of our features are perfectly correlated to our dependent variable. As a result, our model is currently producing 100% accuracy results.

#### Random Forest Model
- We chose a basic Random Forest classifier as ensemble models are capable of handling datasets with many features. Our training dataset contains approximately 37 features across over 2200 rows.
- A benefit to testing a Random Forest model is it allows us to determine a feature importance list from which can be used to inform the feature reduction process.
- This model is also currently producing 100% accuracy results.


## Dashboard

#### As our data contains latitude, longitude, and Census Tract identifiers, we want to utilize a map as the main component of our dashboard. The map will allow the user to select a Census Tract area from the map, where then summary demographic metrics and crime statistics for the selected Census Tract will be displayed under the map.
 
#### To create our dashboard, we will be utilizing Tableau. Tableau will connect to our database, then allow us to create visuals for our presentation slides and interactive dashboard. For the dashboard, we will first need to create three separate sheets, one map and two summary tables/graphs to then combine into the one dashboard. We will use our merged Displacement and Crime table for these visualizations.
 
#### To ensure that anyone who visits our dashboard understands the information presented in the visualizations, we will include our topic, definitions, model use and results, and dashboard purpose in a summary statement to the left of the interactive features. Below is a storyboard of what the dashboard would look like.

#### Dashboard outline can be found on our presentation [Slides](https://docs.google.com/presentation/d/1-TiG67iIzo5gKKd23wOaXQg1TtN5CmG_sfSwT-wCHaw/edit#slide=id.p). 

## Visuals

![Screen Shot 2022-09-18 at 20 16 42](https://user-images.githubusercontent.com/103851131/190938544-586e28ff-bc2d-4c32-a845-641884071422.png)

 - Showing the number of crime reports over the last four years.

<img width="648" alt="Screen Shot 2022-09-18 at 21 33 02" src="https://user-images.githubusercontent.com/103851131/190942288-f3636aeb-9fc3-42a9-bb2b-eea6df7e7fd5.png">

- In continuation of the crime rates over time, we can see that the top five crimes are theft, various burglaries, family disturbances, assault, and criminal conspiracy.

<img width="642" alt="Screen Shot 2022-09-18 at 21 44 57" src="https://user-images.githubusercontent.com/103851131/190942302-ecd81101-dcd5-4313-b0c2-ecb1be1c8ece.png">

- Beginning stage of mapping crime in relation to various areas.
