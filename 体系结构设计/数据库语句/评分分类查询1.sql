create view markinformation as
select movieID,count(*) total,
		 (select count(*) from moviemarklist where movieID = m.movieID and markScore=2) one,
		 (select count(*) from moviemarklist where movieID = m.movieID and markScore=4) two,
		 (select count(*) from moviemarklist where movieID = m.movieID and markScore=6) three,
		 (select count(*) from moviemarklist where movieID = m.movieID and markScore=8) four,
		 (select count(*) from moviemarklist where movieID = m.movieID and markScore=10) five
from moviemarklist m
group by movieID