-- Joining the two tables
SELECT *
FROM marketing_data
JOIN ad_data
ON marketing_data.id = ad_data.id;

-- Which social media platform (Twitter, Instagram, or Facebook) is the most effective method of advertising in each country?
SELECT country, ad_data.channel AS media, COUNT(*) AS lead_conversions  -- Assuming channel is the correct column.
FROM marketing_data
JOIN ad_data
ON marketing_data.id = ad_data.id
GROUP BY country, ad_data.channel;

-- Which social media platform is the most effective method of advertising based on marital status?
SELECT marital_status, ad_data.channel AS media, COUNT(*) AS lead_conversions  -- Assuming channel is the correct column.
FROM marketing_data
JOIN ad_data
ON marketing_data.id = ad_data.id
GROUP BY marital_status, ad_data.channel;

-- Which social media platform(s) seem(s) to be the most effective per country?
SELECT country, ad_data.channel AS media, SUM(ad_data.amount_spent) AS total_spent  -- Adjust amount_spent if needed.
FROM marketing_data
JOIN ad_data
ON marketing_data.id = ad_data.id
GROUP BY country, ad_data.channel;
