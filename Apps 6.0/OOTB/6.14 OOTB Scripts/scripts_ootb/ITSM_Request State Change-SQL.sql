Report: ITSM_Request State Change
Job: 10334
Report Cache Used: No

Number of Columns Returned:		29
Number of Temp Tables:		3

Total Number of Passes:		9
Number of SQL Passes:		9
Number of Analytical Passes:		0

Tables Accessed:
d_calendar_date
d_calendar_month
d_internal_contact_assigned_to
d_internal_organization_group
d_request
d_sc_request_from_request_state
d_sc_request_from_stage
d_sc_request_request_state
d_sc_request_stage
d_sc_request_to_request_state
d_sc_request_to_stage
f_request_activity


SQL Statements:
set query_group to 'MSTRReport=ITSM_Request State Change;'


CREATE TEMPORARY TABLE ZZMD00 as
select	a11.current_state_src_key as row_key,
	a11.current_stage_src_key as row_key0,
	a11.from_state_key as row_key1,
	a11.from_stage_key as row_key2,
	a11.to_state_key as row_key3,
	a11.to_stage_key as row_key4,
	a11.request_key as row_key5,
	a11.changed_on_key as calendar_date_key,
	a11.assignment_group_key as assignment_group_key,
	a11.assigned_to_key as row_key7,
	(sum(a11.primary_duration) / 3600.0) as WJXBFS1,
	max(a11.state_count) as WJXBFS2
from	ldb.f_request_activity	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.changed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
group by	a11.current_state_src_key,
	a11.current_stage_src_key,
	a11.from_state_key,
	a11.from_stage_key,
	a11.to_state_key,
	a11.to_stage_key,
	a11.request_key,
	a11.changed_on_key,
	a11.assignment_group_key,
	a11.assigned_to_key 

CREATE TEMPORARY TABLE ZZMD01 as
select	a11.to_stage_key as row_key,
	(avg(a11.primary_duration) / 3600.0) as WJXBFS1
from	ldb.f_request_activity	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.changed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
group by	a11.to_stage_key 

CREATE TEMPORARY TABLE ZZMD02 as
select	a11.to_state_key as row_key,
	(avg(a11.primary_duration) / 3600.0) as WJXBFS1
from	ldb.f_request_activity	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.changed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
group by	a11.to_state_key 

select	a14.due_on as due_on,
	pa11.row_key4 as row_key,
	max(a18.source_dimension_name) as source_dimension_name,
	pa11.row_key3 as row_key0,
	max(a19.source_dimension_name) as source_dimension_name0,
	pa11.row_key2 as row_key1,
	max(a110.source_dimension_name) as source_dimension_name1,
	pa11.row_key1 as row_key2,
	max(a111.source_dimension_name) as source_dimension_name2,
	a14.opened_on as opened_on,
	pa11.row_key0 as row_key3,
	max(a112.source_dimension_name) as source_dimension_name3,
	pa11.row_key as row_key4,
	max(a113.source_dimension_name) as source_dimension_name4,
	pa11.calendar_date_key as calendar_date_key,
	max(a17.calendar_date) as calendar_date,
	pa11.assignment_group_key as assignment_group_key,
	max(a16.organization_name) as organization_name,
	pa11.row_key7 as row_key5,
	max(a15.full_name) as full_name,
	pa11.row_key5 as row_key6,
	max(a14.source_url) as source_url,
	a14.closed_on as closed_on,
	a14.source_url as source_url0,
	max(a14.request_number) as request_number0,
	max(pa11.WJXBFS1) as WJXBFS1,
	max(pa11.WJXBFS2) as WJXBFS2,
	max(pa12.WJXBFS1) as WJXBFS3,
	max(pa13.WJXBFS1) as WJXBFS4
from	ZZMD00	pa11
	left outer join	ZZMD01	pa12
	  on 	(pa11.row_key4 = pa12.row_key)
	left outer join	ZZMD02	pa13
	  on 	(pa11.row_key3 = pa13.row_key)
	join	ldb.d_request	a14
	  on 	(pa11.row_key5 = a14.row_key)
	join	ldb.d_internal_contact_assigned_to	a15
	  on 	(pa11.row_key7 = a15.row_key)
	join	ldb.d_internal_organization_group	a16
	  on 	(pa11.assignment_group_key = a16.row_key)
	join	ldb.d_calendar_date	a17
	  on 	(pa11.calendar_date_key = a17.row_key)
	join	ldb.d_sc_request_to_stage	a18
	  on 	(pa11.row_key4 = a18.row_key)
	join	ldb.d_sc_request_to_request_state	a19
	  on 	(pa11.row_key3 = a19.row_key)
	join	ldb.d_sc_request_from_stage	a110
	  on 	(pa11.row_key2 = a110.row_key)
	join	ldb.d_sc_request_from_request_state	a111
	  on 	(pa11.row_key1 = a111.row_key)
	join	ldb.d_sc_request_stage	a112
	  on 	(pa11.row_key0 = a112.row_key)
	join	ldb.d_sc_request_request_state	a113
	  on 	(pa11.row_key = a113.row_key)
group by	a14.due_on,
	pa11.row_key4,
	pa11.row_key3,
	pa11.row_key2,
	pa11.row_key1,
	a14.opened_on,
	pa11.row_key0,
	pa11.row_key,
	pa11.calendar_date_key,
	pa11.assignment_group_key,
	pa11.row_key7,
	pa11.row_key5,
	a14.closed_on,
	a14.source_url


drop table ZZMD00

drop table ZZMD01

drop table ZZMD02


[Analytical engine calculation steps:
]
