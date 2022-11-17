# Snow_data_analysis
## Overview
Analysis on snow data and trends since 1990 from six ski resorts around the world. Of these selected ski resorts three are located in the Northern Hemisphere and three are located in the Southern Hemisphere.
The information we wanted to deduct from our analysis is as follows:
* What resort experienced the most total snowfall since 1990
* Which resort had the most powder days (which are defined as days that experience more than 6in snowfall)
* Which month (for each resort) had the least snowfall
* Which month (for each resort) had the most snowfall
* And snowfall trends to help us understand what we can expect of years to come,
* As well as a fun tool that helps predict if it is snowing in your area based on 2 features (temperature and humidity percentage)

## Project Structure
Data - historical weather data dating back to 1990, presented in CSV format.

##### Technologies Used
Jupyter Notebook, Python, Pandas, SQLAlchemy, Scikit-learn, Path, Pickle, Flask,  PostgreSQL, PGAdmin, Tableau, HTML

###### Python
Used for cleaning, Machine Learning, and app.py

###### Database
Used to store Data and analysis.

###### Tableau
Used for visulizations

###### HTML
Used for Flask App

## Ski Resorts
##### Southern Hemisphere
* Craigieburn, New Zealand
* Tiffindell, South Africa
* Valle Nevado, Chili

##### Northern Hemisphere
Furano, Japan
Zermatt, Switzerland
Timberline, Oregon

## Cleaning
Starting Columns were dt, dt_iso, city-name, temp, temp_min, temp_, humidity, show_1h, weather_main, and weather_description.
Of those columns we decided the columns of importance to our analysis were dt, temp, temp_min, temp_max, humidity and snow_1h. The columns deemed unimportant to our analysis were dropped.
Our data was presented as a row for each hour of each day. This made our data harder to understand so the decision was made to resample the data from 24 hourly rows for each day as 1 daily row for each day.
to do this we used resample() and performed aggregates on the remaining columns:
* temp: mean
* temp_min : mean
* temp_max : mean
* humidity : mean
* snow_1h : sum
Finally we set our resampled dt column as the index and renamed the column snow_1h snowfall.

## Export CSV to SQL
Export finished date frame to csv as cleaned file to postgres. Connect database (db_string) to postgresql as a f string from snow_data. Create a database engine to connnect to prostgres using the db_string. Once string is connect to engine, push finished database to sql. 

## Entity Relationship Diagram
Entity relationship diagram provide a visual staring point for database desgin that can also be used to help determine information system requirements. Using all countries (3 southern and 3 nothern hemispheres) to show relationships between the date time (dt).

## SQL Database
* Max snowfall per year
* Maxiumn snowfall in a signal day per each year for all countries.
  - Extract year from dt (date time)
  - Group by year
  - Order by  year Asc
*Only have days where snowfall is > 0
  - Use where clause 
* Average snowfall per year
  -	Extract year from date
  -	Avg snowfall
  -	Group by year
  - Order by year ASC

## Max and Min POW days (6+ inches)
*	Max pow days set to more than or equal to 6+ inches
  -	Extract year from date as count
  -	Extract year from date where snowfall is great than 6+
  -	Group by extracted year
*	Min pow days set to less than or equal to 6 inches
  -	Extract year from date as count
  -	Extract year from date where snowfall is less than 6
  -	Group by extracted year

## For total snowfall in a month per each year 
*	Snowfall per month
  -	Extract year from date
  -	Extract month from date
	- Add (SUM) snowfall as total_snowfall
	- Group by year, month
	- Order by year ASC
*	Max month snowfall 
  -	HAVING SUM (snowfall) greater to 0
  - Order by total snowfall DESC

* Finding and creating tables for which months had snowfall   
* Finding and creating which months had the least snowfall > 0
  - Extract frim dt
  - Extract from month
  - Sum to equal total snowfall
  - Group by year/month have sum snowfall greater 0
  - Order by total snowfall

## Snowfall per year


## Pow Days (6+ inches) Per Year


## Total Snowfall Since 1990 (as inches)


## Deepest Snowfall (in a single day) Per Each Year


## Snowfalll by Week (encompassing since 1990)


## Snowfall Per Month (encompassing since 1990)










