/*
  Validation Checks
1. Define the variables
2. Create a CTE that rounds the average views per video
3. Select the columns that are required for the analysis
4. Filter the results by the Youtube channels with the highest subscribers bases
5. Order by net-profit by (highest to lowest)


*/


-- 1.
DECLARE @conversionrate FLOAT = 0.02;     -- The Conversion Rate @ 2%
DECLARE @productcost MONEY = 5.0;         -- The Product Cost @ $5
DECLARE @campaigncost MONEY =  50000.0;    -- The Campaign Cost @ $50000




-- 2.
WITH ChannelData AS (
    SELECT
	    channel_name,
	    total_views,
	    total_videos,
	    ROUND((CAST(total_views AS FLOAT) / Total_videos), -4) AS rounded_avg_views_per_video
	FROM 
	    youtube_db.dbo.view_uk_youtubers_2024

)


-- 3.
 SELECT 
     channel_name,
	 rounded_avg_views_per_video,
	 (rounded_avg_views_per_video * @conversionrate) AS potential_units_sold_per_video,
	 (rounded_avg_views_per_video * @conversionrate * @productcost) AS potential_revenue_per_video,
      (rounded_avg_views_per_video * @conversionrate * @productcost) - @campaigncost AS net_profit
 
 FROM
     ChannelData

--4. 
 WHERE
      channel_name IN ('NoCopyrightSounds', 'DanTDM', 'Dan Rhodes')

--5.
 ORDER BY 
       net_profit DESC;