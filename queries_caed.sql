 -- Create table for max snowfall in a single day per each year for timberline
CREATE TABLE timberline_max_per_year AS (
	 SELECT
  EXTRACT(year FROM dt) AS year,
  MAX(snowfall) AS max_snowfall
FROM timberline
GROUP BY year
ORDER BY year ASC);

-- Create table for timberline that only has days where snowfall is > 0
CREATE TABLE timberline_snow_days AS (
SELECT * 
FROM timberline WHERE
snowfall > 0);

-- Create table showing average snowfall for all days that experiance snow that year timberline
 CREATE TABLE timberline_avg_per_year AS (
	 SELECT
  EXTRACT(year FROM dt) AS year,
  AVG(snowfall) AS avg_snowfall
FROM timberline_snow_days
GROUP BY year
ORDER BY year ASC);

-- Create table for valle_nevado that only has days where snowfall is > 0
CREATE TABLE valle_nevado_snow_days AS (
SELECT * 
FROM valle_nevado WHERE
snowfall > 0);

-- Create table for max snowfall in a single day each year for valle_nevado
CREATE TABLE valle_nevado_max_per_year AS (
	 SELECT
  EXTRACT(year FROM dt) AS year,
  MAX(snowfall) AS max_snowfall
FROM valle_nevado
GROUP BY year
ORDER BY year ASC);

-- Create table showing average snowfall for all days that experiance snow that year valle_nevado
CREATE TABLE valle_nevado_avg_per_year AS (
	 SELECT
  EXTRACT(year FROM dt) AS year,
  AVG(snowfall) AS avg_snowfall
	From valle_nevado_snow_days
GROUP BY year
ORDER BY year ASC);

-- Create table for max snowfall in a single day per each year for craigieburn
CREATE TABLE craigieburn_max_per_year AS (
	 SELECT
  EXTRACT(year FROM dt) AS year,
  MAX(snowfall) AS max_snowfall
FROM craigieburn
GROUP BY year
ORDER BY year ASC);

-- Create table for craigieburn that only has days where snowfall is > 0
CREATE TABLE craigieburn_snow_days AS (
SELECT * 
FROM craigieburn WHERE
snowfall > 0);

-- Create table showing average snowfall for all days that experiance snow that year craigieburn
 CREATE TABLE craigieburn_avg_per_year AS (
	 SELECT
  EXTRACT(year FROM dt) AS year,
  AVG(snowfall) AS avg_snowfall
FROM craigieburn_snow_days
GROUP BY year
ORDER BY year ASC);

-- Create table for max snowfall in a single day per each year for furano
CREATE TABLE furano_max_per_year AS (
	 SELECT
  EXTRACT(year FROM dt) AS year,
  MAX(snowfall) AS max_snowfall
FROM furano
GROUP BY year
ORDER BY year ASC);

-- Create table for furano that only has days where snowfall is > 0
CREATE TABLE furano_snow_days AS (
SELECT * 
FROM furano WHERE
snowfall > 0);

-- Create table showing average snowfall for all days that experiance snow that year furano
 CREATE TABLE furano_avg_per_year AS (
	 SELECT
  EXTRACT(year FROM dt) AS year,
  AVG(snowfall) AS avg_snowfall
FROM furano_snow_days
GROUP BY year
ORDER BY year ASC);

-- Create table for max snowfall in a single day per each year for zermatt
CREATE TABLE zermatt_max_per_year AS (
	 SELECT
  EXTRACT(year FROM dt) AS year,
  MAX(snowfall) AS max_snowfall
FROM zermatt
GROUP BY year
ORDER BY year ASC);

-- Create table for zermatt that only has days where snowfall is > 0
CREATE TABLE zermatt_snow_days AS (
SELECT * 
FROM zermatt WHERE
snowfall > 0);

-- Create table showing average snowfall for all days that experiance snow that year zermatt
 CREATE TABLE zermatt_avg_per_year AS (
	 SELECT
  EXTRACT(year FROM dt) AS year,
  AVG(snowfall) AS avg_snowfall
FROM zermatt_snow_days
GROUP BY year
ORDER BY year ASC);

-- Create table for max snowfall in a single day per each year for tiffindell
CREATE TABLE tiffindell_max_per_year AS (
	 SELECT
  EXTRACT(year FROM dt) AS year,
  MAX(snowfall) AS max_snowfall
FROM tiffindell
GROUP BY year
ORDER BY year ASC);

-- Create table for tiffindell that only has days where snowfall is > 0
CREATE TABLE tiffindell_snow_days AS (
SELECT * 
FROM tiffindell WHERE
snowfall > 0);

-- Create table showing average snowfall for all days that experiance snow that year tiffindell
 CREATE TABLE tiffindell_avg_per_year AS (
	 SELECT
  EXTRACT(year FROM dt) AS year,
  AVG(snowfall) AS avg_snowfall
FROM tiffindell_snow_days
GROUP BY year
ORDER BY year ASC);

-- How many total snow days timberline?
CREATE TABLE total_snow_days AS (
	SELECT 
  EXTRACT(year FROM dt) AS year,
  COUNT(snowfall)
FROM timberline_snow_days
GROUP BY year
ORDER BY year ASC);

-- How many total snow days craigieburn?
CREATE TABLE craigieburn_total_snow_days AS (
	SELECT 
  EXTRACT(year FROM dt) AS year,
  COUNT(snowfall)
FROM craigieburn_snow_days
GROUP BY year
ORDER BY year ASC);

-- How many total snow days furano?
CREATE TABLE furano_total_snow_days AS (
	SELECT 
  EXTRACT(year FROM dt) AS year,
  COUNT(snowfall)
FROM furano_snow_days
GROUP BY year
ORDER BY year ASC);

-- How many total snow days zermatt?
CREATE TABLE zermatt_total_snow_days AS (
	SELECT 
  EXTRACT(year FROM dt) AS year,
  COUNT(snowfall)
FROM zermatt_snow_days
GROUP BY year
ORDER BY year ASC);

-- How many total snow days valle_nevado?
CREATE TABLE valle_nevado_total_snow_days AS (
	SELECT 
  EXTRACT(year FROM dt) AS year,
  COUNT(snowfall)
FROM valle_nevado_snow_days
GROUP BY year
ORDER BY year ASC);