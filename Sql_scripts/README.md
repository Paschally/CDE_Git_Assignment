/*
Question one:
Find a list of order IDs where either gloss_qty or
poster_qty is greater than 4000. 
Only include the id field in the resulting table. 
*/

select 
	id
from orders
where 
	gloss_qty > 4000
	or poster_qty > 4000


/* 
Question two:
Write a query that returns a list of orders where the standard_qty is zero 
and either the gloss_qty or poster_qty is over 1000. 
*/

select 
	*
from orders
where 
	standard_qty = 0 and
	(gloss_qty > 1000 or poster_qty > 1000)


/*
Question three:
Find all the company names that start with a 'C' or 'W', and 
where the primary contact contains 'ana' or 'Ana', 
but does not contain 'eana'. 
*/

select 
	name
from accounts
where
	(name like 'C%' or name like 'W%') 
	and (lower(primary_poc) like '%ana%') 
	(lower(primary_poc) not like '%eana%')


/* 
Question four:
Provide a table that shows the region for each sales rep along with their associated accounts. 
Your final table should include three columns:
the region name, the sales rep name, and the account name. 
Sort the accounts alphabetically (A-Z) by account name.
*/

select 
	a.name account_name,
	s.name sales_rep_name,
	r.name region_name
from accounts a
left join sales_reps s
	on a.sales_rep_id = s.id
left join region r
	on s.region_id = r.id







