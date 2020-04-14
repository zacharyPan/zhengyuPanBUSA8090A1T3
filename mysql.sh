#!/bin/bash


# problem 1dii
echo "problem 1dii, all duplicate metabolisms in the annotation"
mysql -u awkologist -p compbiol -e 'select distinct a1.metabolism from annotation a1 INNER Join annotation a2 on\
a1.metabolism = a2.metabolism where a1.gene <>a2.gene;'


#Problem2aiii
echo "Problem2iii,  listing all members who don’t have a coach"

mysql -u awkologist -p compbiol -e 'select \
	m.LastName, m.FirstName from Member m where m.Coach is null'



#Problem2biii
echo "Problem2biii,   listing all members who joined during the 2010 calendar year"

mysql -u awkologist -p compbiol -e 'select m.LastName, m.FirstName from Member m where JoinDate LIKE "%2010%";'


#problem2ciii

echo "Problem3ciii, the member names and IDs of those who didn’t compete in any tournaments in 2014, but have competed in other years."

mysql -u awkologist -p compbiol -e 'select distinct m.LastName, m.FirstName, m.MemberID from Member m inner join Entry e on m.MemberID = e.MemberID where e.Year <> 2014;'


#problem2dii
echo "problem2dii the member names and IDs of those who have competed in every year that club members have competed."

mysql -u awkologist -p compbiol -e 'select distinct
e1.MemberID from Entry e1, Entry e2, Entry e3 where e1.Year = 2013 and e2.year = 2014 and e3.year = 2015;'


