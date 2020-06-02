Report: ITSM_Problem State Change
Job: 10314
Report Cache Used: No

Number of Columns Returned:		37
Number of Temp Tables:		2

Total Number of Passes:		7
Number of SQL Passes:		7
Number of Analytical Passes:		0

Tables Accessed:
d_calendar_date
d_calendar_month
d_change_request
d_configuration_item
d_internal_contact_assigned_to
d_internal_organization_group
d_problem
d_problem_from_state
d_problem_impact
d_problem_priority
d_problem_state
d_problem_to_state
d_problem_urgency
f_problem_state_activity


SQL Statements:
set query_group to 'MSTRReport=ITSM_Problem State Change;'


CREATE TEMPORARY TABLE ZZMD00 as
select	a11.to_state_key as row_key,
	avg((a11.state_duration / 86400.0)) as WJXBFS1
from	ldb.f_problem_state_activity	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.state_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
group by	a11.to_state_key 

CREATE TEMPORARY TABLE ZZMD01 as
select	a11.urgency_src_key as row_key,
	a11.state_count as state_count,
	a11.primary_sequence_id as primary_sequence_id,
	a11.priority_src_key as row_key0,
	a11.from_state_key as row_key1,
	a11.to_state_key as row_key2,
	a11.impact_src_key as row_key3,
	a11.problem_key as problem_key,
	a11.state_on_key as calendar_date_key,
	a11.configuration_item_key as configuration_item_key,
	a11.change_request_key as row_key5,
	a11.assignment_group_key as assignment_group_key,
	a11.assigned_to_key as row_key6,
	sum((a11.state_duration / 86400.0)) as WJXBFS1
from	ldb.f_problem_state_activity	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.state_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
group by	a11.urgency_src_key,
	a11.state_count,
	a11.primary_sequence_id,
	a11.priority_src_key,
	a11.from_state_key,
	a11.to_state_key,
	a11.impact_src_key,
	a11.problem_key,
	a11.state_on_key,
	a11.configuration_item_key,
	a11.change_request_key,
	a11.assignment_group_key,
	a11.assigned_to_key 

select	a13.work_start_on as work_start_on,
	a13.closed_on as closed_on,
	a13.due_on as Due_On_MM_DD,
	pa11.row_key3 as row_key,
	max(a19.source_dimension_name) as source_dimension_name,
	a13.known_error_flag as known_error_flag,
	pa11.row_key2 as row_key0,
	max(a110.source_dimension_name) as source_dimension_name0,
	pa11.row_key1 as row_key1,
	max(a111.source_dimension_name) as source_dimension_name1,
	a13.opened_on as opened_on,
	pa11.row_key0 as row_key2,
	max(a112.source_dimension_name) as source_dimension_name2,
	pa11.primary_sequence_id as primary_sequence_id,
	a13.short_description as short_description,
	a13.state_src_key as row_key3,
	max(a114.source_dimension_name) as source_dimension_name3,
	pa11.row_key as row_key4,
	max(a113.source_dimension_name) as source_dimension_code4,
	pa11.problem_key as problem_key,
	max(a13.problem_number) as problem_number,
	a13.work_end_on as work_end_on,
	pa11.row_key5 as row_key6,
	max(a16.change_request_number) as row_id,
	pa11.state_count as state_count,
	pa11.calendar_date_key as calendar_date_key,
	max(a18.calendar_date) as calendar_date,
	pa11.assignment_group_key as assignment_group_key,
	max(a15.organization_name) as organization_name,
	pa11.row_key6 as row_key7,
	max(a14.full_name) as full_name,
	pa11.configuration_item_key as configuration_item_key,
	max(a17.name) as name,
	a13.source_url as source_url0,
	max(a13.problem_number) as problem_number0,
	max(pa12.WJXBFS1) as WJXBFS1,
	max(pa11.WJXBFS1) as WJXBFS2
from	ZZMD01	pa11
	left outer join	ZZMD00	pa12
	  on 	(pa11.row_key2 = pa12.row_key)
	join	ldb.d_problem	a13
	  on 	(pa11.problem_key = a13.row_key)
	join	ldb.d_internal_contact_assigned_to	a14
	  on 	(pa11.row_key6 = a14.row_key)
	join	ldb.d_internal_organization_group	a15
	  on 	(pa11.assignment_group_key = a15.row_key)
	join	ldb.d_change_request	a16
	  on 	(pa11.row_key5 = a16.row_key)
	join	ldb.d_configuration_item	a17
	  on 	(pa11.configuration_item_key = a17.row_key)
	join	ldb.d_calendar_date	a18
	  on 	(pa11.calendar_date_key = a18.row_key)
	join	ldb.d_problem_impact	a19
	  on 	(pa11.row_key3 = a19.row_key)
	join	ldb.d_problem_to_state	a110
	  on 	(pa11.row_key2 = a110.row_key)
	join	ldb.d_problem_from_state	a111
	  on 	(pa11.row_key1 = a111.row_key)
	join	ldb.d_problem_priority	a112
	  on 	(pa11.row_key0 = a112.row_key)
	join	ldb.d_problem_urgency	a113
	  on 	(pa11.row_key = a113.row_key)
	join	ldb.d_problem_state	a114
	  on 	(a13.state_src_key = a114.row_key)
group by	a13.work_start_on,
	a13.closed_on,
	a13.due_on,
	pa11.row_key3,
	a13.known_error_flag,
	pa11.row_key2,
	pa11.row_key1,
	a13.opened_on,
	pa11.row_key0,
	pa11.primary_sequence_id,
	a13.short_description,
	a13.state_src_key,
	pa11.row_key,
	pa11.problem_key,
	a13.work_end_on,
	pa11.row_key5,
	pa11.state_count,
	pa11.calendar_date_key,
	pa11.assignment_group_key,
	pa11.row_key6,
	pa11.configuration_item_key,
	a13.source_url


drop table ZZMD00

drop table ZZMD01


[Analytical engine calculation steps:
]