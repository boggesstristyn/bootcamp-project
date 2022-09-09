-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Crime_Reports" (
    "Zip_Code" int   NOT NULL,
    "Occured_Date" date   NOT NULL,
    "APD_District" var   NOT NULL,
    "Highest_Offense_Description" var   NOT NULL
);

CREATE TABLE "Austin_Housing_Market" (
    "Zip_Code" int   NOT NULL,
    "Population_Below_Poverty_Level" int   NOT NULL,
    "Median_Household_Income" int   NOT NULL,
    "Unemployment" int   NOT NULL,
    "Median_Home_Value" int   NOT NULL,
    "Change_Number_of_Housing_Units" int   NOT NULL,
    "Change_in_Median_Rent" int   NOT NULL,
    "Rentals_less_than_25K_income" int   NOT NULL,
    "Homes_less_than_50k_income" int   NOT NULL
);

ALTER TABLE "Crime_Reports" ADD CONSTRAINT "fk_Crime_Reports_Zip_Code" FOREIGN KEY("Zip_Code")
REFERENCES "Austin_Housing_Market" ("Zip_Code");

