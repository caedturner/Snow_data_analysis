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
