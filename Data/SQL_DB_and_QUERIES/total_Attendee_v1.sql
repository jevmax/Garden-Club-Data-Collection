Select *
from summer_Series.dbo.fiveTen

UNION 
Select *
from summer_Series.dbo.thirtyForty

UNION 
Select *
from summer_Series.dbo.fortyfiveFifty
;


-- combining the tables first and only grabbing members only



-- getting the sum of attendees, not purchasers, from all three datasets. 
-- this includes solo members using a complimentary ticket to get in for free. 

SELECT sum(Attendee_Count) as [Total Attendees : ]
FROM(
SELECT Attendee_Count FROM summer_Series.dbo.fiveTen
UNION ALL
SELECT Attendee_Count FROM summer_Series.dbo.thirtyForty
UNION ALL 
SELECT Attendee_Count FROM summer_Series.dbo.fortyfiveFifty
)

as attendee 
; 


/* Getting the amount of members from the total attendees. This would only count as the member that purchased the ticket to the event. 
   I don't know if any guests going with them were members as well OR members that purchased their own ticket. */

SELECT count(Member_Rank) as [Total Member Purchases : ]
FROM(
SELECT Member_Rank FROM summer_Series.dbo.fiveTen
WHERE Note = 'purchased as Member'

UNION ALL
SELECT Member_Rank FROM summer_Series.dbo.thirtyForty
WHERE Note = 'purchased as Member'

UNION ALL 
SELECT Member_Rank FROM summer_Series.dbo.fortyfiveFifty
WHERE Note = 'purchased as Member'
) as attendee_member 
;

/* Getting the total of Gen Admission purchases, but just counted everyone first, then filtered*/
SELECT count(Note) as [Total Non Member Purchases : ]
FROM(
SELECT Note FROM summer_Series.dbo.fiveTen
WHERE Note = 'purchased as Gen.Ad' 

UNION ALL
SELECT Note FROM summer_Series.dbo.thirtyForty
WHERE Note = 'purchased as Gen.Ad' 

UNION ALL 
SELECT Note FROM summer_Series.dbo.fortyfiveFifty
WHERE Note = 'purchased as Gen.Ad' 
) as attendee_non_member 
;

/*cancelled*/
SELECT count(Member_ID) as [Total Cancellations : ]
FROM(
SELECT * FROM summer_Series.dbo.fiveTen
WHERE Note = 'cancelled' 

UNION ALL
SELECT * FROM summer_Series.dbo.thirtyForty
WHERE Note = 'cancelled' 

UNION ALL 
SELECT * FROM summer_Series.dbo.fortyfiveFifty
WHERE Note = 'cancelled' 
) as cancelled 
;