/*

# 1. Row count check 

Count the total number of records (or rows) are in the SQL view

*/

SELECT
    COUNT(*) AS no_of_rows
FROM
    youtube_db.dbo.view_uk_youtubers_2024;