/*
 
 # 2. Column count check 

Count the total number of columns (or fields) are in the SQL view

*/


SELECT
    COUNT(*) AS column_count
FROM
    INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_NAME = 'youtube_db.dbo.view_uk_youtubers_2024'
