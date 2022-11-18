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
Export finished date frame to csv as cleaned file to postgres. Connect database (db_string) to PostgreSQL as a f string from snow_data. Create a database engine to connect to PostgreSQL using the db_string. Once string is connected to engine, push finished database to SQL.

## Entity Relationship Diagram
Entity relationship diagram provide a visual starting point for database design that can also be used to help determine information system requirements. Using all countries (3 southern and 3 northern hemispheres) to show relationships between the date time (dt).

## SQL Database
#### Max snowfall per year
#### Maximum snowfall in a signal day per each year for all countries.
  -	Extract year from dt (date time)
  -	Group by year
  -	Order by year Asc
*	Only have days where snowfall is > 0
  -	Use where clause
*	Average snowfall per year
  -	Extract year from date
  -	Avg snowfall
  -	Group by year
  -	Order by year ASC

## Max and Min POW days (6+ inches)
#### Max pow days set to more than or equal to 6+ inches
  -	Extract year from date as count
  -	Extract year from date where snowfall is great than 6+
  -	Group by extracted year
#### Min pow days set to less than or equal to 6 inches
  -	Extract year from date as count
  -	Extract year from date where snowfall is less than 6
  -	Group by extracted year

## For total snowfall in a month per each year
#### Snowfall per month
  -	Extract year from date
  -	Extract month from date
#### Add (SUM) snowfall as total_snowfall
	 - Group by year, month
  -	Order by year ASC
#### Max month snowfall
  -	HAVING SUM (snowfall) greater to 0
  -	Order by total snowfall DESC
#### Finding and creating tables for which months had snowfall
#### Finding and creating which months had the least snowfall > 0
  -	Extract from dt
  -	Extract from month
  -	Sum to equal total snowfall
  -	Group by year/month have sum snowfall greater 0
  -	Order by total snowfall

## Snowfall per year
Separated countries by southern (bottom of graph) and northern (top of graph) hemispheres to show snowfall trends during the year. Southern countries have the least amount of snowfall per year, except for Valle Nevado with the highest snowfall in 1997. Tiffindell shows little to no snowfall throughout 1991-2021, which found the county, makes most of their snow. Northern countries have more snowfall per year, where Timberline have the highest in 2021.

## Pow Days (6+ inches) Per Year
The northern countries have more powder days per year than southern countries. Highest powder day in the northern hemisphere is Timberline at 100 inches back in 2021. The highest powder day in the southern hemisphere is Valle Nevado at 50 back in 1997. Tiffindell shows no signs of improvement.

## Total Snowfall Since 1990 (as inches)
Compare southern and northern hemispheres total snowfall since 1990. Bar graph shows majority of northern countries are in the top snowfall since 1990.

## Deepest Snowfall (in a single day) Per Each Year
Shown in graph, deepest snowfall in a single day by country. shown in previous graphs, Timberline (northern) had the greats amount of snowfall since 1990. even through timberline had the great amount of snowfall they lack the amount of snow deepest. The deepest snowfall is Zermatt back in 2012. All southern hemispheres have the lowest amount of snow deepest.

## Snowfall by Week (encompassing since 1990)
As shown in graph, amount of snowfall by week (2-53). The week of the year corresponds to the months where the best time of the year to hit the slop. For northern, the best time would be weeks 2-11 then 50-53. For the southern, weeks 23 - 38. The hemispheres are opposite seasons. Northern hemispheres tend to pack more snowfall compared to southern hemispheres.

## Snowfall Per Month (encompassing since 1990)
Graph shows snowfalls per month (January - December), during the months of December and January to be peak for northern hemispheres. Where southern hemispheres peak times are July and June. The hemispheres show the change in season where snowfall is best for shredding the mountain.
