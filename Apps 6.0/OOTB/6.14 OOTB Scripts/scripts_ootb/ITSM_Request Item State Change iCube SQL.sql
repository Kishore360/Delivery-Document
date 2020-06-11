Report: ITSM_Request Item State Change
Job: 10326
Report Cache Used: No

Number of Columns Returned:		36
Number of Temp Tables:		4

Total Number of Passes:		11
Number of SQL Passes:		11
Number of Analytical Passes:		0

Tables Accessed:
d_calendar_date
d_calendar_month
d_internal_contact_assigned_to
d_internal_organization_department
d_master_item
d_request
d_request_item
d_request_item_from_stage
d_request_item_from_state
d_request_item_stage
d_request_item_state
d_request_item_to_stage
d_request_item_to_state
f_request_item_activity


SQL Statements:
set query_group to 'MSTRReport=ITSM_Request Item State Change;'


CREATE TEMPORARY TABLE ZZMD00 as
select	a11.current_state_src_key as state_src_key,
	a11.current_stage_src_key as row_key,
	a11.from_state_key as row_key0,
	a11.from_stage_key as row_key1,
	a11.to_state_key as row_key2,
	a11.to_stage_key as row_key3,
	a11.request_item_key as request_item_key,
	a11.request_key as row_key5,
	a12.item_number as item_number,
	a11.opened_by_department_key as opened_by_department_key,
	a11.changed_on_key as calendar_date_key,
	a11.assigned_to_key as row_key7,
	(sum(a11.primary_duration) / 3600.0) as WJXBFS1,
	max(a11.state_count) as WJXBFS2
from	ldb.f_request_item_activity	a11
	join	ldb.d_master_item	a12
	  on 	(a11.item_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.changed_on_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a13.month_start_date_key = a14.row_key)
where	a14.lagging_count_of_month between 0 and 12
group by	a11.current_state_src_key,
	a11.current_stage_src_key,
	a11.from_state_key,
	a11.from_stage_key,
	a11.to_state_key,
	a11.to_stage_key,
	a11.request_item_key,
	a11.request_key,
	a12.item_number,
	a11.opened_by_department_key,
	a11.changed_on_key,
	a11.assigned_to_key 

CREATE TEMPORARY TABLE ZZMD01 as
select	a11.to_state_key as row_key,
	avg((a11.primary_duration / 3600.0)) as WJXBFS1
from	ldb.f_request_item_activity	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.changed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
group by	a11.to_state_key 

CREATE TEMPORARY TABLE ZZMD02 as
select	a11.to_stage_key as row_key,
	avg((a11.primary_duration / 3600.0)) as WJXBFS1
from	ldb.f_request_item_activity	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.changed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
group by	a11.to_stage_key 

CREATE TEMPORARY TABLE ZZMD03 as
select	a11.row_key as row_key,
	(a11.target_duration / 86400.0) as WJXBFS1
from	ldb.d_request_item_stage	a11 

select	pa11.row_key1 as row_key,
	max(a113.source_dimension_name) as source_dimension_name,
	pa11.row_key0 as row_key0,
	max(a114.source_dimension_name) as source_dimension_name0,
	a15.opened_on as opened_on,
	pa11.row_key as row_key1,
	max(a115.source_dimension_name) as source_dimension_name1,
	pa11.state_src_key as state_src_key,
	max(a116.source_dimension_name) as source_dimension_name2,
	pa11.row_key7 as row_key2,
	max(a17.full_name) as full_name,
	a15.closed_on as closed_on,
	a15.due_on as due_on,
	pa11.row_key5 as row_key3,
	max(a16.source_url) as source_url,
	pa11.request_item_key as request_item_key,
	max(a15.source_url) as source_url0,
	pa11.row_key3 as row_key6,
	max(a111.source_dimension_name) as source_dimension_name3,
	pa11.row_key2 as row_key7,
	max(a112.source_dimension_name) as source_dimension_name4,
	pa11.calendar_date_key as calendar_date_key,
	max(a18.calendar_date) as calendar_date,
	pa11.opened_by_department_key as opened_by_department_key,
	max(a19.organization_name) as organization_name,
	pa11.item_number as item_number,
	max(a110.item_name) as item_name,
	a15.source_url as source_url1,
	max(a15.request_item_number) as request_item_number0,
	a16.source_url as source_url2,
	max(a16.request_number) as request_number0,
	max(pa11.WJXBFS1) as WJXBFS1,
	max(pa11.WJXBFS2) as WJXBFS2,
	max(pa12.WJXBFS1) as WJXBFS3,
	max(pa13.WJXBFS1) as WJXBFS4,
	max(pa14.WJXBFS1) as WJXBFS5
from	ZZMD00	pa11
	left outer join	ZZMD01	pa12
	  on 	(pa11.row_key2 = pa12.row_key)
	left outer join	ZZMD02	pa13
	  on 	(pa11.row_key3 = pa13.row_key)
	left outer join	ZZMD03	pa14
	  on 	(pa11.row_key = pa14.row_key)
	join	ldb.d_request_item	a15
	  on 	(pa11.request_item_key = a15.row_key)
	join	ldb.d_request	a16
	  on 	(pa11.row_key5 = a16.row_key)
	join	ldb.d_internal_contact_assigned_to	a17
	  on 	(pa11.row_key7 = a17.row_key)
	join	ldb.d_calendar_date	a18
	  on 	(pa11.calendar_date_key = a18.row_key)
	join	ldb.d_internal_organization_department	a19
	  on 	(pa11.opened_by_department_key = a19.row_key)
	join	ldb.d_master_item	a110
	  on 	(pa11.item_number = a110.item_number)
	join	ldb.d_request_item_to_stage	a111
	  on 	(pa11.row_key3 = a111.row_key)
	join	ldb.d_request_item_to_state	a112
	  on 	(pa11.row_key2 = a112.row_key)
	join	ldb.d_request_item_from_stage	a113
	  on 	(pa11.row_key1 = a113.row_key)
	join	ldb.d_request_item_from_state	a114
	  on 	(pa11.row_key0 = a114.row_key)
	join	ldb.d_request_item_stage	a115
	  on 	(pa11.row_key = a115.row_key)
	join	ldb.d_request_item_state	a116
	  on 	(pa11.state_src_key = a116.row_key)
group by	pa11.row_key1,
	pa11.row_key0,
	a15.opened_on,
	pa11.row_key,
	pa11.state_src_key,
	pa11.row_key7,
	a15.closed_on,
	a15.due_on,
	pa11.row_key5,
	pa11.request_item_key,
	pa11.row_key3,
	pa11.row_key2,
	pa11.calendar_date_key,
	pa11.opened_by_department_key,
	pa11.item_number,
	a15.source_url,
	a16.source_url


drop table ZZMD00

drop table ZZMD01

drop table ZZMD02

drop table ZZMD03


[Analytical engine calculation steps:
]
