#!/bin/bash
# join two file with select columns
# author Zhengyu Pan
# April 14th, 2020

# first of all, let me sort both of  my table with the header
# (Need to sort text keeping first line always first, n.d.) 
(head -1 question1a.tab;sort <(sed -n '2,$p' question1a.tab))> question1a_sorted.tab
(head -1 question1b.tab;sort <(sed -n '2,$p' question1b.tab))> question1b_sorted.tab

# then join them together 
join -t $'\t' question1b_sorted.tab question1a_sorted.tab > foo.tab 

# last drop the column we don't need(metabolism, which is the third column)
# (How to remove a column or multiple columns from file using shell command?, n.d.)
awk '{$3=""; print $0}' foo.tab

# reference

# How to remove a column or multiple columns from file using shell command? (n.d.). Unix & Linux Stack Exchange. Retrieved April 14, 2020, from https://unix.stackexchange.com/questions/222121/how-to-remove-a-column-or-multiple-columns-from-file-using-shell-command
# Need to sort text keeping first line always first. (n.d.). Retrieved April 14, 2020, from https://www.unix.com/shell-programming-and-scripting/244756-need-sort-text-keeping-first-line-always-first.html






