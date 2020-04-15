#!/bin/bash
# Author Zhengyu Pan
# April 15th, 2020

# I put all mysql code in one file so it would be easy to run


# problem 1 part d ii
echo "problem 1 part d ii, all duplicate metabolisms in the annotation"
mysql -u awkologist -p compbiol -e 'select distinct a1.metabolism from annotation a1 INNER Join annotation a2 on\
a1.metabolism = a2.metabolism where a1.gene <>a2.gene;'


#Problem 2 part a iii
echo "Problem 2 part a iii,  listing all members who don’t have a coach"

mysql -u awkologist -p compbiol -e 'select \
	m.LastName, m.FirstName from Member m where m.Coach is null;'



#Problem 2 part b iii
echo "Problem 2 part b iii,  listing all members who joined during the 2010 calendar year"

mysql -u awkologist -p compbiol -e 'select m.LastName, m.FirstName from Member m where JoinDate LIKE "%2010%";'


#problem 2 part c iii

echo "Problem 3 part c iii, the member names and IDs of those who didn’t compete in any tournaments in 2014, but have competed in other years."

mysql -u awkologist -p compbiol -e 'select distinct m.LastName, m.FirstName, m.MemberID from Member m inner join Entry e on e.MemberID = m.MemberID where not exists(select * from Entry e where e.MemberID = m.MemberID and e.Year = 2014);'


#problem 2 part d ii
echo "problem 2 part d ii the member names and IDs of those who have competed in every year that club members have competed."

 mysql -u awkologist -p compbiol -e 'select m.LastName, m.FirstName, m.MemberID\
from Member m where not exists\
(select * from Entry e1 where not exists\
(select * from Entry e2 where e2.MemberID = m.MemberID and \
e1.Year = e2.Year));'


