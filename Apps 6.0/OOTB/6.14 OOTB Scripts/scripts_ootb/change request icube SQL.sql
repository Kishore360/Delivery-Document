Report: ITSM_Change Request State Change
Job: 10365
Report Cache Used: No

Number of Columns Returned:		25
Number of Temp Tables:		2

Total Number of Passes:		7
Number of SQL Passes:		7
Number of Analytical Passes:		0

Tables Accessed:
d_calendar_date
d_calendar_month
d_change_request
d_change_request_from_state
d_change_request_risk
d_change_request_state
d_change_request_to_state
d_change_request_type
d_internal_contact_assigned_to
f_change_request_state_activity


SQL Statements:
set query_group to 'MSTRReport=ITSM_Change Request State Change;'


CREATE TEMPORARY TABLE ZZMD00 as
select	a11.state_on_key as calendar_date_key,
	a11.change_risk_key as row_key,
	a11.change_type_key as row_key0,
	a11.current_state_key as row_key1,
	a11.from_state_key as row_key2,
	a11.to_state_key as row_key3,
	a11.change_request_key as row_key4,
	a11.assigned_to_key as row_key5,
	max(a11.state_count) as WJXBFS1,
	(sum(a11.state_duration) / 3600.0) as WJXBFS2
from	ldb.f_change_request_state_activity	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.state_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
group by	a11.state_on_key,
	a11.change_risk_key,
	a11.change_type_key,
	a11.current_state_key,
	a11.from_state_key,
	a11.to_state_key,
	a11.change_request_key,
	a11.assigned_to_key 

CREATE TEMPORARY TABLE ZZMD01 as
select	a11.to_state_key as row_key,
	(avg(a11.state_duration) / 3600.0) as WJXBFS1
from	ldb.f_change_request_state_activity	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.state_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
group by	a11.to_state_key 

select	pa11.row_key3 as row_key,
	max(a15.source_dimension_name) as source_dimension_name,
	pa11.row_key2 as row_key0,
	max(a16.source_dimension_name) as source_dimension_name0,
	pa11.row_key1 as row_key1,
	max(a17.source_dimension_name) as source_dimension_name1,
	pa11.row_key5 as row_key2,
	max(a14.full_name) as full_name,
	pa11.calendar_date_key as calendar_date_key,
	max(a110.calendar_date) as calendar_date,
	a13.closed_on as closed_on,
	a13.opened_on as opened_on,
	pa11.row_key4 as row_key3,
	max(a13.change_request_number) as row_id,
	max(a13.source_url) as source_url,
	a13.due_on as due_on,
	pa11.row_key as row_key4,
	max(a19.source_dimension_name) as source_dimension_name2,
	pa11.row_key0 as row_key5,
	max(a18.source_dimension_name) as source_dimension_name3,
	a13.source_url as source_url0,
	max(a13.change_request_number) as change_request_number,
	max(pa11.WJXBFS1) as WJXBFS1,
	max(pa11.WJXBFS2) as WJXBFS2,
	max(pa12.WJXBFS1) as WJXBFS3
from	ZZMD00	pa11
	left outer join	ZZMD01	pa12
	  on 	(pa11.row_key3 = pa12.row_key)
	join	ldb.d_change_request	a13
	  on 	(pa11.row_key4 = a13.row_key)
	join	ldb.d_internal_contact_assigned_to	a14
	  on 	(pa11.row_key5 = a14.row_key)
	join	ldb.d_change_request_to_state	a15
	  on 	(pa11.row_key3 = a15.row_key)
	join	ldb.d_change_request_from_state	a16
	  on 	(pa11.row_key2 = a16.row_key)
	join	ldb.d_change_request_state	a17
	  on 	(pa11.row_key1 = a17.row_key)
	join	ldb.d_change_request_type	a18
	  on 	(pa11.row_key0 = a18.row_key)
	join	ldb.d_change_request_risk	a19
	  on 	(pa11.row_key = a19.row_key)
	join	ldb.d_calendar_date	a110
	  on 	(pa11.calendar_date_key = a110.row_key)
group by	pa11.row_key3,
	pa11.row_key2,
	pa11.row_key1,
	pa11.row_key5,
	pa11.calendar_date_key,
	a13.closed_on,
	a13.opened_on,
	pa11.row_key4,
	a13.due_on,
	pa11.row_key,
	pa11.row_key0,
	a13.source_url


drop table ZZMD00

drop table ZZMD01


[Analytical engine calculation steps:
]
