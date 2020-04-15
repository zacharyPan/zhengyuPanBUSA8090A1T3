select distinct a1.metabolism from annotation a1 INNER Join annotation a2 on\
a1.metabolism = a2.metabolism where a1.gene <>a2.gene;
