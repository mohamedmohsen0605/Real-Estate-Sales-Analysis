CREATE DATABASE Real_Estate

SELECT * FROM [dbo].[R_Estatee]

SELECT [Zip_Code] ,[City] FROM [dbo].[R_Estatee]
WHERE [Price] > 200000

SELECT [No_Beds],[No_Baths],[City],[State],[House_Size_s_feet],[No_Bedrooms], [Price] FROM [dbo].[R_Estatee]
WHERE  [Zip_Code] = '3862'

SELECT [Price] FROM [dbo].[R_Estatee]
WHERE [Zip_Code] = '3862'

SELECT[Size_Status],COUNT(*) AS House_Size_No FROM [dbo].[R_Estatee] GROUP BY [Size_Status] ;

SELECT [No_Beds],[No_Baths],[No_Bedrooms],COUNT(*) FROM [dbo].[R_Estatee] GROUP BY [No_Beds] , [No_Baths],[No_Bedrooms];

SELECT[House_Size_s_feet] , [Price], [Zip_Code], COUNT(*) FROM [dbo].[R_Estatee] GROUP BY [Zip_Code], [House_Size_s_feet],[Price];

--AVERGAE PRICE BY ZIP_CODE--

SELECT [Zip_Code] , AVG([Price]) AS Avg_Price  FROM [dbo].[R_Estatee]
GROUP BY [Zip_Code] ORDER BY [Zip_Code];

--TOTAL NUMBER OF SALES  PER YEAR 

SELECT [Year] , COUNT(*) AS TOTAL_SALES FROM [dbo].[R_Estatee]
GROUP BY [Year] ORDER BY [Year];

--AVERGAE PRICE BY HOUSE SIZE--

SELECT [Size_Status],AVG([Price]) AS AVG_PRICE_BY_SIZE 
FROM [dbo].[R_Estatee] GROUP BY[Size_Status]
ORDER BY AVG_PRICE_BY_SIZE DESC ; 

--TOP 10 MOST EXPENSIVE HOUSES--

SELECT [Zip_Code],[No_Beds],[No_Baths],[City],[State],[House_Size_s_feet],[Sold_Date],
[Price],[No_Bedrooms],[Size_Status] FROM [dbo].[R_Estatee] 
ORDER BY[Price] DESC ;

--PRICE TREND OVER THE YEARS--

SELECT [Year],AVG([Price]) AS AVG_PRICES_OVER_YEARS FROM [dbo].[R_Estatee]
GROUP BY [Year] ORDER BY [Year] ;

--SALES DISTRIBUTION BY CITY--

SELECT [City] ,
COUNT(*) AS TOTAL_SALES ,
AVG([Price]) AS AVG_PRICE_BY_CITY
FROM [dbo].[R_Estatee]
GROUP BY [City]
ORDER BY TOTAL_SALES ;

--SALES DISTRIBUTION BY STATE--

SELECT [State] ,
COUNT(*) AS TOTAL_SALES ,
AVG([Price]) AS AVG_PRICE_BY_STATE
FROM [dbo].[R_Estatee]
GROUP BY [State] 
ORDER BY TOTAL_SALES ;

--

SELECT
    CASE
        WHEN  [Price] < 1000000 THEN 'Under 1M'
        WHEN [Price] BETWEEN 1000000 AND 5000000 THEN '1M-5M'
        WHEN [Price] BETWEEN 5000000 AND 10000000 THEN '5M-10M'
        WHEN [Price] BETWEEN 10000000 AND 15000000 THEN '10-15M'
        ELSE '15M and Above'
    END AS price_range ,
    COUNT(*) AS NUMBER_OF_HOUSES
FROM
    [dbo].[R_Estatee]
GROUP BY
CASE
        WHEN  [Price] < 1000000 THEN 'Under 1M'
        WHEN [Price] BETWEEN 1000000 AND 5000000 THEN '1M-5M'
        WHEN [Price] BETWEEN 5000000 AND 10000000 THEN '5M-10M'
        WHEN [Price] BETWEEN 10000000 AND 15000000 THEN '10-15M'
        ELSE '15M and Above'
    END 
    
ORDER BY
    NUMBER_OF_HOUSES DESC;


--AVERAGE PRICE BY STATE--

SELECT [State] , AVG([Price]) AS AVG_PRICE_BY_STATE 
FROM [dbo].[R_Estatee]
GROUP BY [State]
ORDER BY AVG_PRICE_BY_STATE ;



