Report: ITSM_Catalog Task State Change
Job: 10342
Report Cache Used: No

Number of Columns Returned:		46
Number of Temp Tables:		2

Total Number of Passes:		7
Number of SQL Passes:		7
Number of Analytical Passes:		0

Tables Accessed:
d_calendar_date
d_calendar_month
d_internal_contact_assigned_to
d_internal_organization_group
d_request
d_request_item
d_request_item_stage
d_request_item_state
d_request_task
d_sc_task_approval
d_sc_task_from_state
d_sc_task_priority
d_sc_task_state
d_sc_task_to_state
d_sc_task_upon_approval
f_request_task_state_activity


SQL Statements:
set query_group to 'MSTRReport=ITSM_Catalog Task State Change;'


CREATE TEMPORARY TABLE ZZMD00 as
select	a11.to_state_key as row_key,
	(avg(a11.state_duration) / 3600.0) as WJXBFS1
from	ldb.f_request_task_state_activity	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.state_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
group by	a11.to_state_key 

CREATE TEMPORARY TABLE ZZMD01 as
select	a11.upon_approval_src_key as row_key,
	a11.current_request_task_state_key as row_key0,
	a11.priority_src_key as row_key1,
	a11.from_state_key as row_key2,
	a11.to_state_key as row_key3,
	a11.approval_state_src_key as row_key4,
	a11.request_task_key as request_task_key,
	a11.current_request_item_state_key as state_src_key,
	a11.current_request_item_stage_key as row_key6,
	a11.request_item_key as request_item_key,
	a11.request_key as row_key8,
	a11.state_on_key as calendar_date_key,
	a11.assignment_group_key as assignment_group_key,
	a11.assigned_to_key as row_key10,
	max(a11.state_count) as WJXBFS1,
	(sum(a11.state_duration) / 3600.0) as WJXBFS2
from	ldb.f_request_task_state_activity	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.state_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
group by	a11.upon_approval_src_key,
	a11.current_request_task_state_key,
	a11.priority_src_key,
	a11.from_state_key,
	a11.to_state_key,
	a11.approval_state_src_key,
	a11.request_task_key,
	a11.current_request_item_state_key,
	a11.current_request_item_stage_key,
	a11.request_item_key,
	a11.request_key,
	a11.state_on_key,
	a11.assignment_group_key,
	a11.assigned_to_key 

select	a15.source_url as source_url,
	max(a15.request_task_number) as request_task_number,
	pa11.row_key3 as row_key,
	max(a112.source_dimension_name) as source_dimension_name,
	pa11.row_key2 as row_key0,
	max(a113.source_dimension_name) as source_dimension_name0,
	pa11.row_key1 as row_key1,
	max(a114.source_dimension_name) as source_dimension_name1,
	a15.short_description as short_description,
	pa11.row_key10 as row_key2,
	max(a16.full_name) as full_name,
	a15.closed_on as closed_on,
	a15.due_on as due_on,
	a15.opened_on as opened_on,
	pa11.calendar_date_key as calendar_date_key,
	max(a18.calendar_date) as calendar_date,
	pa11.row_key6 as row_key3,
	max(a19.source_dimension_name) as source_dimension_name2,
	pa11.request_item_key as request_item_key,
	max(a13.request_item_number) as request_item_number,
	max(a13.source_url) as source_url0,
	pa11.state_src_key as state_src_key,
	max(a110.source_dimension_name) as source_dimension_name3,
	pa11.request_task_key as request_task_key,
	max(a15.request_task_number) as request_task_number0,
	max(a15.source_url) as CustCol_166,
	pa11.row_key8 as row_key6,
	max(a14.request_number) as request_number,
	max(a14.source_url) as source_url1,
	pa11.row_key4 as row_key8,
	max(a111.source_dimension_name) as source_dimension_name4,
	pa11.row_key as row_key9,
	max(a116.source_dimension_name) as source_dimension_name5,
	a15.work_end_on as work_end_on,
	a15.work_start_on as work_start_on,
	pa11.assignment_group_key as assignment_group_key,
	max(a17.organization_name) as organization_name,
	pa11.row_key0 as row_key10,
	max(a115.source_dimension_name) as source_dimension_name6,
	a13.source_url as source_url2,
	max(a13.request_item_number) as request_item_number0,
	a14.source_url as source_url3,
	max(a14.request_number) as request_number0,
	max(pa12.WJXBFS1) as WJXBFS1,
	max(pa11.WJXBFS1) as WJXBFS2,
	max(pa11.WJXBFS2) as WJXBFS3
from	ZZMD01	pa11
	left outer join	ZZMD00	pa12
	  on 	(pa11.row_key3 = pa12.row_key)
	join	ldb.d_request_item	a13
	  on 	(pa11.request_item_key = a13.row_key)
	join	ldb.d_request	a14
	  on 	(pa11.row_key8 = a14.row_key)
	join	ldb.d_request_task	a15
	  on 	(pa11.request_task_key = a15.row_key)
	join	ldb.d_internal_contact_assigned_to	a16
	  on 	(pa11.row_key10 = a16.row_key)
	join	ldb.d_internal_organization_group	a17
	  on 	(pa11.assignment_group_key = a17.row_key)
	join	ldb.d_calendar_date	a18
	  on 	(pa11.calendar_date_key = a18.row_key)
	join	ldb.d_request_item_stage	a19
	  on 	(pa11.row_key6 = a19.row_key)
	join	ldb.d_request_item_state	a110
	  on 	(pa11.state_src_key = a110.row_key)
	join	ldb.d_sc_task_approval	a111
	  on 	(pa11.row_key4 = a111.row_key)
	join	ldb.d_sc_task_to_state	a112
	  on 	(pa11.row_key3 = a112.row_key)
	join	ldb.d_sc_task_from_state	a113
	  on 	(pa11.row_key2 = a113.row_key)
	join	ldb.d_sc_task_priority	a114
	  on 	(pa11.row_key1 = a114.row_key)
	join	ldb.d_sc_task_state	a115
	  on 	(pa11.row_key0 = a115.row_key)
	join	ldb.d_sc_task_upon_approval	a116
	  on 	(pa11.row_key = a116.row_key)
group by	a15.source_url,
	pa11.row_key3,
	pa11.row_key2,
	pa11.row_key1,
	a15.short_description,
	pa11.row_key10,
	a15.closed_on,
	a15.due_on,
	a15.opened_on,
	pa11.calendar_date_key,
	pa11.row_key6,
	pa11.request_item_key,
	pa11.state_src_key,
	pa11.request_task_key,
	pa11.row_key8,
	pa11.row_key4,
	pa11.row_key,
	a15.work_end_on,
	a15.work_start_on,
	pa11.assignment_group_key,
	pa11.row_key0,
	a13.source_url,
	a14.source_url


drop table ZZMD00

drop table ZZMD01


[Analytical engine calculation steps:
]