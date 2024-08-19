-- Create the table

---------------------------------------
CREATE TABLE public."DimDate"
(
    dateid integer NOT NULL,
    date date,
    Year integer,
    Quarter integer,
    QuarterName character(50),
    Month integer,
    Monthname character(50),
    Day integer,
    Weekday integer,
    WeekdayName character(50),
    CONSTRAINT "DimDate_pkey" PRIMARY KEY (dateid)
);

-------------------------------------------------------

CREATE TABLE public."DimCategory"
(
    categoryid integer NOT NULL,
    category character(50),
    CONSTRAINT "DimCategory_pkey" PRIMARY KEY (categoryid)
);

-------------------------------------------------------

CREATE TABLE public."DimCountry"
(
    countryid integer NOT NULL,
    country character(50),
    CONSTRAINT "DimCountry_pkey" PRIMARY KEY (countryid)
);

-----------------------------------------------------------

CREATE TABLE public."FactSales"
(
    orderid integer NOT NULL,
    dateid integer,
    countryid integer,
    categoryid integer,
    amount integer,
    CONSTRAINT "FactSales_pkey" PRIMARY KEY (orderid)
);


#######################
-- Create a grouping sets query using the columns country, category, totalsales.
-- The query should return the total sales for each country and category.


SELECT country, category, SUM(amount) AS totalsales
FROM public."FactSales" fs
JOIN public."DimCountry" dc ON fs.countryid = dc.countryid
JOIN public."DimCategory" dcat ON fs.categoryid = dcat.categoryid
GROUP BY GROUPING SETS (country, category, (country, category));

# Create a rollup query using the columns year, country, and totalsales.
# The query should return the total sales for each year, country, and category.

SELECT Year, country, SUM(amount) AS totalsales
FROM public."FactSales" fs
JOIN public."DimDate" dd ON fs.dateid = dd.dateid
JOIN public."DimCountry" dc ON fs.countryid = dc.countryid
GROUP BY ROLLUP (Year, country);

# Create a cube query using the columns year, country, and average sales.

SELECT Year, country, AVG(amount) AS averagesales
FROM public."FactSales" fs
JOIN public."DimDate" dd ON fs.dateid = dd.dateid
JOIN public."DimCountry" dc ON fs.countryid = dc.countryid
GROUP BY CUBE (Year, country);

# Create an MQT named total_sales_per_country that has the columns country and total_sales.

CREATE MATERIALIZED VIEW total_sales_per_country AS
SELECT country, SUM(amount) AS total_sales
FROM public."FactSales" fs
JOIN public."DimCountry" dc ON fs.countryid = dc.countryid
GROUP BY country;
