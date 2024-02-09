Background
-
While my employer serves gardeners, garden clubs, and horticulturists nationally, we have a specific case where a garden club based out in Wisconsin was curious to find out how their collection of events did throughout the summer. Dubbed the “Summer Series”, this had a set of garden tour events where those interested would be able to tour the property of a garden curated by the club themselves. If the club knows the results, then their leadership and members can focus on what to prioritize next year. 

There is a membership system within our organization that allows those who are interested in visiting gardens across the country being able do so at a slightly discounted price. They are also granted two complimentary tickets (also known as credits) along with each membership renewal to incentivize bringing a guest or to visit a site for free. Those who purchase a ticket has an automatic ID number generated for future use in our organization’s database but doesn’t automatically grant membership (offered separately).  

Because some members are older and not tech savvy outside gardening, the garden club does not want a simple headcount and monetary total of the series. They want to have a visual reference they can look at and understand while planning for the next year’s Summer Series. 

What are the specific results the garden club needs?
---
•	Total dollar amount of those who paid general admission. </br>
•	Total dollar amount for those who are members. </br>
•	Visitors who have used complimentary tickets. </br>
•	What event had the most attendance? The least? </br>
•	Percentages of the general admission, membership, and comp. tickets per event.</br>
•	Total members who had purchased tickets.</br>
•	Total members who used their comp. tickets.</br>


There are cases where a member can use a complimentary ticket on themselves with no guest, meaning the attendee count is positive with $0 spent. Comp tickets were also not allowed in events with the ‘EV’ placed in their Event ID to discourage members using their limited number of tickets on higher priced events (and to earn a higher amount for those events).
The events labeled ‘EV’ are more in-depth and are at a higher price. Rather than just a showcase and self-guided tour, the gardener will provide a lecture or brief history of the property and why they chose the aesthetic, layout, and plants to result in the garden. A timed Q&A is also provided should the talk leave anything out. 
 

What are the data and tools needed?
---
To meet the objectives this garden club wants I was able to export the necessary data from each event from our overall database and create multiple queries to pull registrants from each event. I’d them convert each spreadsheet into a dataset I can manipulate in SQL through <b>Microsoft SQL Server Management Studio 19</b> so I can look at each event and get what I needed. Excel and SQL (in this instance, Google’s BigQuery SQL sandbox) both have tools to get the answers I need. I’ll use both the split duties that improves my process. Once all these objectives are met, I can then focus on making a visualization for the garden club.

Process
---
Some things to note before I started:</br>

•	To protect the privacy of the attendees for this project, I changed the names of participants, the specific locations in Wisconsin to only their ID classification, and the amount spent on tickets while keeping the totals accurate.</br>

•	Some members of our organization will be seen as a member in the dataset but show their purchase as general admission in the ‘Note’ column. This means that they either became a member after the event later or a member registered for the event online without being logged in as a member. </br>

•	Cancellations will show in some data, but that only applies to those that did not come to the event or the cancellation of a specific event.</br>

•	Our database exports in .csv format, but to continue cleaning the data and making it readable and accurate I immediately changed each dataset to an .xlsx format for those to view in Excel or Google Sheets. </br>


My initial idea was to create one large dataset combining all events into one. While this would be the easiest solution, it’d be a bit more difficult to narrow down which event did better than the other.  The data visualization could look more off putting since showing that one event did worse than another on a larger scale.  I decided to combine them everything later. 

Good thing too because a large, combined spreadsheet to query in the beginning was asking for trouble. Some events were priced differently than others due to our membership discounts vs. general admission. Some events are ranged between $5, $10, $30, $40, and $50. I split the data into three datasets based on the range of the ticket prices to maintain accurate totals.

<b>Excel</b>: cleaning and fixing the .csv: All cells needed a value to avoid future difficulties in SQL. Any blanks in the spreadsheet were filled with a value such as ‘NonMember’ or ‘none’.</br>

![test](https://github.com/jevmax/Garden-Club-Data-Collection/blob/main/images/sql_1_1.png?raw=true)

 
<b>SQL</b>: I was going to use bit.io or Google Cloud to import and query my three datasets. However, (and understandably so) I was hit with a paywall when it was time to use INNER JOIN and combine the datasets for what I want. So as an alternative, I used Microsoft SQL Server Management Studio 19 and imported the datasets as Flat File Imports. Plus, this very small database in MSSM can serve as a backup should I need it.
 

Formation of my results 
---
So what were the key results?</br>
![](https://github.com/jevmax/Garden-Club-Data-Collection/blob/main/images/visuals_sample.png?raw=true)

•	‘Kn24’, ‘Ba24’, and ‘Dan19’ are the top three events earning $2415, $2230, and $1790 respectively. The attendance figures for each of those events had a very good turnout with each of them having over 200 attendees each.</br>
•	General Admission made up 77% of the 1800 attendees across all events. </br>
•	‘Ba 24’ had the highest amount of complimentary ticket usage at 10. While it’s wrong to assume that the high attendance to that event is the reason for those tickets being used, it shows that there was a higher chance for them to be used due to the high attendance. </br>

Other results I was able to query in SQL:</br>
•	Total amount for all events. ($21,225)</br>
•	Total amount for all events that charged $5 for members and $10 for general admission. ($13,745)</br>
•	Total amount for all events that charged $30 for members and $40 for general admission. ($2,500)</br>
•	Total amount for all events that charged $45 for members and $50 for general admission. ($4,980)</br>
•	Finding the number of members who used comp tickets (20)</br>
•	Total amount of comp tickets used across all three datasets (28)</br>
•	Total amount of attendees including the ones that purchased tickets. (1,800)</br>
•	Total amount of members who purchased tickets (207)</br>
•	Total amount of non-members who purchased tickets (683)</br>
•	Total amount of cancellations throughout the series (22)</br>
•	Total amount of members among the attendees:
(267 of 269. 2 did not attend due to their events being cancelled)</br>


Event Earnings: I chose the waterfall graph over a bar or pie graph because it shows, out of the total earnings, what event performed better and in what financial range the ticket sales came in. <b> Thinking of the garden club member who doesn’t wish to be caught up with graphs, I wanted them to get the gist of where a specific event landed financially, giving me a chance to walk through the results with them. </b>
![](https://github.com/jevmax/Garden-Club-Data-Collection/blob/main/images/sql_1_2.png?raw=true)
</br>
![](https://github.com/jevmax/Garden-Club-Data-Collection/blob/main/images/sql_1_4.png?raw=true)
</br>

What can we make of the results?
---
• The key findings show that this year’s collection of properties have been a success with non-members, since they were the majority of those who attended, so our organization can partner with the garden club can reach out to thank them for coming to their chosen location. Soliciting membership can also be presented to those living in Wisconsin to join the garden club if they’re so inclined!</br>

• The garden club can reach out to the owners of the gardens featured and get feedback of what continues to work and what opportunities could be addressed.  A glaring fix would be the registration process (the ‘Member buying a General Admission ticket’ issue can and should be stamped out by next year).  Networking with other gardeners and willing horticulturists in Wisconsin can also lead to a potential partnership, showing off a property that most of the public might have overlooked.</br> 

• Even if they were at the bottom financially, I’d still encourage the garden club to make more EV class events. It would show that the club has a much higher value proposition for being a member. If general admission attendees were wowed this year and became members, then next year the anticipation for that event could potentially bring in the curious. If the club is ambivalent about risking higher priced events, have the top performing locations such as ‘Mushrooms’ and ‘Magic’ at one time in the late morning or early afternoon rather than two time slots. Attendance numbers from locals and out of towners are more than likely to increase knowing that they have time to arrive.</br>

While it is always at the discretion of the garden club’s leadership, the data that was presented to them serve as the foundation of a strategy simple and flexible enough to follow while adding or removing elements that don’t focus on improving the Summer Series.</br>

