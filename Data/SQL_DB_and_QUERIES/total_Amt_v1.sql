Select *
From summer_Series.dbo.fiveTen
Where Credits_Used > 0 ;
/*Getting the total amount of money */

SELECT SUM(Amount) as [Total Amount for all events:]
FROM (
SELECT Amount  FROM summer_Series.dbo.fiveTen
UNION ALL 
SELECT Amount  FROM summer_Series.dbo.thirtyForty
UNION ALL 
SELECT Amount  FROM summer_Series.dbo.fortyfiveFifty
) AS vik
;


SELECT sum(Amount) as [ $5/$10 Events Total ]
FROM summer_Series.dbo.fiveTen;

SELECT sum(Amount) as [$30/$40 Events Total ]
FROM summer_Series.dbo.thirtyForty

SELECT sum(Amount) as [ $45/$50 Events Total ]
FROM summer_Series.dbo.fortyfiveFifty;

