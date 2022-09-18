# Database

During this phase of the project, created the databases using the three source csv files. You can find these in the Cleaning file.

1. crime_reports_cleaning.ipynb
2. displacement_risk_cleaning.ipynb
3. housing_cleaning.ipynb

Within each database we cleaned the columns and checked the data types. After cleaning, we were able to create dataframes. Once the dataframes were established, we imported SQLite to our code and created tables in SQL. 

For reference we also updated our ERD tables. Below is the code:

CREATE TABLE "Crime_Reports" (
    "incident_report_number" int   NOT NULL,
    "crime_type" var   NOT NULL,
    "ucr_code" int   NOT NULL,
    "occ_date" date   NOT NULL,
    "location_type" var   NOT NULL,
    "address" var   NOT NULL,
    "zip_code" int   NOT NULL,
    "council_district" int   NOT NULL,
    "sector" var   NOT NULL,
    "district" var   NOT NULL,
    "census_tract" var   NOT NULL,
    "x_coordinate" int   NOT NULL,
    "y_coordinate" int   NOT NULL,
    "latitude" int   NOT NULL,
    "longitude" int   NOT NULL
);

CREATE TABLE "Housing_Date" (
    "Zip_Code" int   NOT NULL,
    "Population_below_poverty_level" int   NOT NULL,
    "Median_household_income" int   NOT NULL,
    "Non-White_Non-Hispanic_or_Latino" int   NOT NULL,
    "Hispanic_or_Latino_of_any_race" int   NOT NULL,
    "Population_with_disability" int   NOT NULL,
    "Unemployment" int   NOT NULL,
    "Large_households_5_members" int   NOT NULL,
    "Homes_affordable_to_people_earning_less_than_50000" int   NOT NULL,
    "Rentals_affordable_to_people_earning_less_than_25000" int   NOT NULL,
    "Rent-restricted_units" int   NOT NULL,
    "Housing_Choice_Voucher_holders" int   NOT NULL,
    "Median_rent" int   NOT NULL,
    "Median_home_value" int   NOT NULL,
    "Percentage_of_rental_units_in_poor_condition" int   NOT NULL,
    "Percent_change_in_number_of_housing_units_2000-2012" int   NOT NULL,
    "Owner_units_affordable_to_average_retail_service_worker" int   NOT NULL,
    "Rental_units_affordable_to_average_retail_service_worker" int   NOT NULL,
    "Rental_units_affordable_to_average_artist" int   NOT NULL,
    "Owner_units_affordable_to_average_artist" int   NOT NULL,
    "Rental_units_affordable_to_average_teacher" int   NOT NULL,
    "Owner_units_affordable_to_average_teacher" int   NOT NULL,
    "Rental_units_affordable_to_average_tech_worker" int   NOT NULL,
    "Owner_units_affordable_to_average_tech_worker" int   NOT NULL,
    "Change_in_percentage_of_population_below_poverty_2000-2012" int   NOT NULL,
    "Change_in_median_rent_2000-2012" int   NOT NULL,
    "Change_in_median_home_value_2000-2012" int   NOT NULL,
    "Percentage_of_homes_within_1_4-mi_of_transit_stop" int   NOT NULL,
    "Average_monthly_transportation_cost" int   NOT NULL,
    "Percentage_of_housing_and_transportation_costs_that_is_transportation-related" int   NOT NULL
);

CREATE TABLE "Displacement_Risk_Data" (
    "the_geom" var   NOT NULL,
    "COUNCIL_DI" int   NOT NULL,
    "Total_Population_2020" int   NOT NULL,
    "Total_Hispanic_Pop_2020" int   NOT NULL,
    "Total_NH_White_2020" int   NOT NULL,
    "Total_NH_Black_2020" int   NOT NULL,
    "Total_NH_AM_Indian_AK_Native_2020" int   NOT NULL,
    "Total_NH_Asian_2020" int   NOT NULL,
    "Total_NH_Native_Hawaiian_2020" int   NOT NULL,
    "Total_NH_Other_Races_2020" int   NOT NULL,
    "Total_NH_Two_or_More_Races_2020" int   NOT NULL,
    "Total_Housing_Units_2020" int   NOT NULL,
    "Occupied_Housing_Units_2020" int   NOT NULL,
    "Vacant_Housing_Units_2020" int   NOT NULL,
    "TRACTCE10" int   NOT NULL,
    "NAME10" var   NOT NULL,
    "GeoIDNum" int   NOT NULL,
    "NAME_1" var   NOT NULL,
    "GENTRIFICATION_Typology" var   NOT NULL,
    "VULNERABLE_Pop" var   NOT NULL,
    "DEMOGRAPHIC_Change" var   NOT NULL,
    "HOUSING_MARKET" var   NOT NULL,
    "DISPLACEMENT_RISK" var   NOT NULL,
    "White_Not_Hispanic_2019" int   NOT NULL,
    "Population_25_and_older_2019" int   NOT NULL,
    "Education_Less_than_HS_2019" int   NOT NULL,
    "Education_HS_Graduate_2019" int   NOT NULL,
    "Education_Some_College_2019" int   NOT NULL,
    "Education_Bachelors_2019" int   NOT NULL,
    "Pop_under_18_for_whom_poverty_is_determined_2019" int   NOT NULL,
    "Population_below_poverty_2019" int   NOT NULL,
    "Percent_Child_Poverty_2019" int   NOT NULL,
    "Occupied_Housing_Units_2019" int   NOT NULL,
    "Owner_Occupied_Housing_Units_2019" int   NOT NULL,
    "Renter_Occupied_Housing_Units_2019" int   NOT NULL,
    "Sum_of_Lowmoduniverse_2019" int   NOT NULL,
    "Sum_of_Lowmod_2019" int   NOT NULL,
    "Median_Family_Income_2019" int   NOT NULL,
    "Median_Home_Value_2019" int   NOT NULL,
    "Median_Gross_Rent_2019" int   NOT NULL,
    "Quadrant_2019" var   NOT NULL,
    "Percent_severely_rent_burdened_2019" int   NOT NULL
);

ALTER TABLE "Crime_Reports" ADD CONSTRAINT "fk_Crime_Reports_zip_code" FOREIGN KEY("zip_code")
REFERENCES "Housing_Date" ("Zip_Code");

ALTER TABLE "Displacement_Risk_Data" ADD CONSTRAINT "fk_Displacement_Risk_Data_GeoIDNum" FOREIGN KEY("GeoIDNum")
REFERENCES "Crime_Reports" ("census_tract");