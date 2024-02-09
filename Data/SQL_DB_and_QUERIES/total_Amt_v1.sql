/*Getting the total amount of money */
SELECT *
From summer_Series.dbo.fiveTen
Where Credits_Used > 0 ;


SELECT SUM(Amount) as [Total Amount for all events:]
FROM (
SELECT Amount  FROM summer_Series.dbo.fiveTen
UNION ALL 
SELECT Amount  FROM summer_Series.dbo.thirtyForty
UNION ALL 
SELECT Amount  FROM summer_Series.dbo.fortyfiveFifty
) AS vik
;

-- get the amount of totals between $5 and 10
SELECT sum(Amount) as [ $5/$10 Events Total ]
FROM summer_Series.dbo.fiveTen;

-- $30 and $40
SELECT sum(Amount) as [$30/$40 Events Total ]
FROM summer_Series.dbo.thirtyForty

-- $45 and $50
SELECT sum(Amount) as [ $45/$50 Events Total ]
FROM summer_Series.dbo.fortyfiveFifty;

