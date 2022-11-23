# Snow_data_analysis
### Presentation
https://youtu.be/5Fe_WfsvnAQ
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
Starting Columns were dt, dt_iso, city-name, temp, temp_min, temp_, humidity, show_1h, weather_main, and weather_description amonst many others. In total, we had 27 different columns. <br>
![Starting Columns](https://user-images.githubusercontent.com/107770394/203470017-b53a7041-2ee4-45ce-955b-3f1567691f78.png)
<br>
Of those columns we decided the columns of importance to our analysis were dt, temp, temp_min, temp_max, humidity and snow_1h. The columns deemed unimportant to our analysis were dropped.
Our data was presented as a row for each hour of each day. This made our data harder to understand so the decision was made to resample the data from 24 hourly rows for each day as 1 daily row for each day.
to do this we used resample() and performed aggregates on the remaining columns:
* temp: mean
* temp_min : mean
* temp_max : mean
* humidity : mean
* snow_1h : sum <br>
![After Cleaning](https://user-images.githubusercontent.com/107770394/203470931-ce2d25e2-54e8-4785-9aa2-8120f5af3514.png)
<br>
Finally we set our resampled dt column as the index and renamed the column snow_1h snowfall. <br>

![Final2](https://user-images.githubusercontent.com/107770394/203471982-b7b7b35d-118e-4073-acf4-19a711e2559a.png)<br>

## Export CSV to SQL
Export finished date frame to csv as cleaned file to postgres. Connect database (db_string) to PostgreSQL as a f string from snow_data. Create a database engine to connect to PostgreSQL using the db_string. Once string is connected to engine, push finished database to SQL.

![Screenshot_20221115_064104](https://user-images.githubusercontent.com/107443962/203211776-e2786a3d-53f4-4434-901f-dc2c3c65c398.png)

## Entity Relationship Diagram
Entity relationship diagram provide a visual starting point for database design that can also be used to help determine information system requirements. Using all countries (3 southern and 3 northern hemispheres) to show relationships between the date time (dt).

![Project_Erd](https://user-images.githubusercontent.com/107443962/203211806-e84b8cc8-2389-4ca5-b8e1-5d72d3ecbf89.png)

## SQL Database

![Timberline_max_avg_per_year](https://user-images.githubusercontent.com/107443962/203212535-c2279a92-d3b9-4e88-9434-3ba7be08e341.png)

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

![Timberline_Max_Min_pow_days](https://user-images.githubusercontent.com/107443962/203213053-2fcebc6d-ff5f-4675-9d20-8f882ee893cd.png)

## Max and Min POW days (6+ inches)
#### Max pow days set to more than or equal to 6+ inches
  -	Extract year from date as count
  -	Extract year from date where snowfall is great than 6+
  -	Group by extracted year
#### Min pow days set to less than or equal to 6 inches
  -	Extract year from date as count
  -	Extract year from date where snowfall is less than 6
  -	Group by extracted year

![Screenshot_20221121_073145](https://user-images.githubusercontent.com/107443962/203214786-1fdaee1b-1c04-4dae-8372-40d4ac844d4e.png)

## For total snowfall in a month per each year
#### Snowfall per month
  -	Extract year from date
  -	Extract month from date
#### Add (SUM) snowfall as total_snowfall
  -     Group by year, month
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

![Screenshot_20221109_082756](https://user-images.githubusercontent.com/107443962/203212892-88f7bd8c-c85c-4809-86f3-ba5e286a884c.png)


<img width="989" alt="per_year_pow" src="https://user-images.githubusercontent.com/107443962/203212367-7df4cd76-2945-4ee1-b67b-bbcba1677666.png">

## Snowfall per year
Separated countries by southern (bottom of graph) and northern (top of graph) hemispheres to show snowfall trends during the year. Southern countries have the least amount of snowfall per year, except for Valle Nevado with the highest snowfall in 1997. Tiffindell shows little to no snowfall throughout 1991-2021, which found the county, makes most of their snow. Northern countries have more snowfall per year, where Timberline have the highest in 2021.

## Pow Days (6+ inches) Per Year
The northern countries have more powder days per year than southern countries. Highest powder day in the northern hemisphere is Timberline at 100 inches back in 2021. The highest powder day in the southern hemisphere is Valle Nevado at 50 back in 1997. Tiffindell shows no signs of improvement.

## Total Snowfall Since 1990 (as inches)
Compare southern and northern hemispheres total snowfall since 1990. Bar graph shows majority of northern countries are in the top snowfall since 1990.

<img width="985" alt="total" src="https://user-images.githubusercontent.com/107443962/203212119-7957cda4-908a-422f-b917-262982a5274a.png">

## Deepest Snowfall (in a single day) Per Each Year
Shown in graph, deepest snowfall in a single day by country. shown in previous graphs, Timberline (northern) had the greats amount of snowfall since 1990. even through timberline had the great amount of snowfall they lack the amount of snow deepest. The deepest snowfall is Zermatt back in 2012. All southern hemispheres have the lowest amount of snow deepest.

<img width="903" alt="deepest_day" src="https://user-images.githubusercontent.com/107443962/203212148-24657371-db08-4c8b-8483-b80d3d4e25e1.png">


<img width="993" alt="snowfall_week_month" src="https://user-images.githubusercontent.com/107443962/203212221-27f75ecc-e770-48b2-bac3-0215d5ea83f7.png">

## Snowfall by Week (encompassing since 1990)
As shown in graph, amount of snowfall by week (2-53). The week of the year corresponds to the months where the best time of the year to hit the slop. For northern, the best time would be weeks 2-11 then 50-53. For the southern, weeks 23 - 38. The hemispheres are opposite seasons. Northern hemispheres tend to pack more snowfall compared to southern hemispheres.

## Snowfall Per Month (encompassing since 1990)
Graph shows snowfalls per month (January - December), during the months of December and January to be peak for northern hemispheres. Where southern hemispheres peak times are July and June. The hemispheres show the change in season where snowfall is best for shredding the mountain.

The first thing we did for the machine learning aspect for this project was using the Random Forest to try and predict whether it will snow or not based on the data we have received. Looking back at our cleaned data set, as a reminder we have the date, the average temperature, the min and max temperature, humidity, and snowfall. In the case of predicting if it snows or not, the date, as well as the min and max temps are not important, so we went ahead and dropped those, leaving us with the average temperature and humidity. We then went ahead and changed the snowfall column to either 1 or 0, with one being it did snow vs 0 where it did not.

## Machine Learning
### Random Forests
The first thing we did for the machine learning aspect for this project was using the Random Forest to try and predict whether it will snow or not based on the data we have received. Looking back at our cleaned data set, as a reminder we have the date, the average temperature, the min and max temperature, humidity, and snowfall. In the case of predicting if it snows or not, the date, as well as the min and max temps are not important, so we went ahead and dropped those, leaving us with the average temperature and humidity. We then went ahead and changed the snowfall column to either 1 or 0, with one being it did snow vs 0 where it did not.

<img width="653" alt="confusion_matrix" src="https://user-images.githubusercontent.com/107770394/203467394-4f3bf718-ffdd-4595-8e3d-d10380b46e71.png">

Through our random forest model, we were able to hash out 17,975 total predictions. Out of those, our test was correctly able to predict 2521 instances where it snowed, and 12,985 days where it did not. This led to an accuracy score of over 86%. Although it was not perfect, that is still a great score to have.  It also incorrectly predicted it not snowing 1221 times, and incorrectly predicted it snowing 1248 times.

In terms or precision, when trying to predict it not snowing, our model predicted it to not snow 14,206 times. Since it correctly predicted 12,985 times, that led to a precision of 91%, which is excellent. However, the precision for trying to predict it not snowing is not as good. Our model predicted it to snow a total of 3769 times. It correctly predicted 2521 of those times, giving us a precision of 67%

In terms of sensitivity, our results were fairly similar to our precision scores. Our sensitivity for not snowing, we had it correctly predict it 12,985, with a false negative of 1248 times, giving us a sensitivity of 91%. In terms of it snowing, it correctly predicted it 2521 times, with a false negative of 1221 times, giving us a sensitivity score of 67%.

### Linear Regression
We next wanted to find out if we can find a prediction of snowfall for each resort, then each hemisphere, then finally the world itself. Linear Regression was a great choice, as it creates a best fit line based on the data we created. So, we are inspecting the relationship between snowfall and years for each model. Out of the six ski resorts, four of them had an increase in snow per year, Furano, Zermatt, Timberline, and Tiffindell. The other two, Craigieburn and Valle Nevado, had a decrease in snow per year. <br>![North_Hemi_Prediction](https://user-images.githubusercontent.com/107770394/203467545-603a7f39-004a-4a57-8650-eb1f72ae0e10.png)<br>
Looking at the Northern Hemisphere, each of them had a positive increase, so there was a positive increase in snowfall per year.<br>![South_Hemi_Prediction](https://user-images.githubusercontent.com/107770394/203467620-10ab98db-70cb-4d04-aa16-749f57fbc8a5.png) <br>
Looking at the Southern Hemisphere, with two of the three having less snowfall per year, that led to our results having a negative relationship with snowfall per year.<br> ![Ski_Resorts_Predictions](https://user-images.githubusercontent.com/107770394/203467698-f199535d-a130-4acd-875d-110747205215.png)<br>
Finally, in looking at all six at once, we found that there was a positive increase in snowfall per year.

## In Conclusion
When starting this project, all three of us predicted that there was less snowfall per year now then there was back then. To our surprise, we found it quite the opposite, with more snowfall now than 30 years ago, at least with these six ski resorts.

Something we could have done differently was not taking as many columns out during our cleaning process. When trying to create visualizations, we found that we may have taken to much data out, and limited ourselves with what we could visualize. We still were able to establish what we initially set out to, but we may have been able to do so much more if we gave ourselves more to work with.


## Citations
We would like to thank Open Weather for providing us with the data presented for this project. The link to their website and API can be found here: https://home.openweathermap.org/history_bulks/new.

