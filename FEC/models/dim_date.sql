-- dim_date.sql

SELECT
    DATEKEY AS date_key,
    DATEVALUE AS date,
    YEAR AS year,
    QUARTER AS quarter,
    MONTH AS month,
    DAYOFMONTH AS day,
    CASE
        WHEN ISWEEKDAY = 1 THEN 'Weekday'
        WHEN ISWEEKDAY = 0 THEN 'Weekend'
        ELSE NULL
    END AS weekday
FROM {{ source('STAGED', 'STA_DATES') }}
