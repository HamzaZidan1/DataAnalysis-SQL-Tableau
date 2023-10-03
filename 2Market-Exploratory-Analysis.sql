-- Creating marketing_data table
CREATE TABLE marketing_data (
   id integer,
   age integer,
   gender text,
   country text,
   date date,
   category text,
   product text,
   spend decimal
);

-- Creating ad_data table
CREATE TABLE ad_data (
   id integer,
   date date,
   campaign text,
   channel text,
   ad text,
   impressions integer,
   clicks integer
);

-- Summing up spend per country
SELECT country, SUM(spend) as total_spend
FROM marketing_data
GROUP BY country
ORDER BY total_spend DESC;

-- Getting total sales per country and product
SELECT country, product, COUNT(*) as total_sales
FROM marketing_data
GROUP BY country, product
ORDER BY country, total_sales DESC;

-- Joining tables and getting sales based on marital status and product
SELECT m.status, md.product, COUNT(*) as total_sales
FROM marketing_data md
JOIN marital_status m ON md.id = m.id
GROUP BY m.status, md.product
ORDER BY m.status, total_sales DESC;

-- Analysis based on children and teenagers
SELECT CASE 
         WHEN children_teenagers = true THEN 'Yes'
         ELSE 'No'
       END AS has_children_teenagers, product, COUNT(*) as total_sales
FROM marketing_data
GROUP BY has_children_teenagers, product;
