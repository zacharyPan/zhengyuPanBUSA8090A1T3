select m.LastName, m.FirstName, m.MemberID\
from Member m where not exists\
(select * from Entry e1 where not exists\
(select * from Entry e2 where e2.MemberID = m.MemberID and \
e1.Year = e2.Year));
