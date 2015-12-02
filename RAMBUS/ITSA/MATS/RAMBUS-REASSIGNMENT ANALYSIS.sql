Report: Reassignment analysis
Job: 44868
Report Cache Used: No

Number of Columns Returned:		27
Number of Temp Tables:		0

Total Number of Passes:		1
Number of SQL Passes:		1
Number of Analytical Passes:		0

Tables Accessed:
d_calendar_date
d_calendar_date_opened
d_calendar_month_opened
d_configuration_item
d_incident
d_incident_category
d_internal_organization_group
d_internal_organization_group_reassignment_c
d_task_contacttype
f_incident_reassignment_analysis_c


SQL Statements:

select	a11.old_assignment_group_key AS assignment_group_key,
	max(a15.organization_name) AS organization_name,
	a11.new_assignment_group_key AS row_key,
	max(a16.organization_name) AS organization_name0,
	a11.created_on_key AS calendar_date_key,
	max(a13.calendar_date) AS calendar_date,
	a13.month_start_date_key AS month_start_date_key,
	max(a13.month_name) AS month_name,
	a13.quarter_start_date_key AS row_key0,
	max(a13.quarter_name) AS quarter_name,
	a13.year_start_date_key AS row_key1,
	max(a13.year_name) AS year_name,
	a11.incident_key AS incident_key,
	max(a12.incident_number) AS incident_number,
	a12.row_key AS row_key3,
	max(a12.description) AS description,
	a11.sequence_id AS sequence_id,
	a11.reported_type_src_key AS row_key4,
	max(a19.source_dimension_name) AS source_dimension_name,
	a11.opened_on_key AS row_key5,
	max(a14.calendar_date) AS calendar_date0,
	a12.created_on AS created_on,
	a11.business_service_c_key AS row_key6,
	max(a17.name) AS name,
	a11.category_src_key AS row_key7,
	max(a18.source_dimension_name) AS source_dimension_name0,
	sum(a11.duration) AS WJXBFS1
from	ldb.f_incident_reassignment_analysis_c	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.created_on_key = a13.row_key)
	join	ldb.d_calendar_date_opened	a14
	  on 	(a11.opened_on_key = a14.row_key)
	join	ldb.d_internal_organization_group	a15
	  on 	(a11.old_assignment_group_key = a15.row_key)
	join	ldb.d_internal_organization_group_reassignment_c	a16
	  on 	(a11.new_assignment_group_key = a16.row_key)
	join	ldb.d_configuration_item	a17
	  on 	(a11.business_service_c_key = a17.row_key)
	join	ldb.d_incident_category	a18
	  on 	(a11.category_src_key = a18.row_key)
	join	ldb.d_task_contacttype	a19
	  on 	(a11.reported_type_src_key = a19.row_key)
	join	ldb.d_calendar_month_opened	a110
	  on 	(a14.month_start_date_key = a110.row_key)
where	a110.lagging_count_of_month between 0 and 11
group by	a11.old_assignment_group_key,
	a11.new_assignment_group_key,
	a11.created_on_key,
	a13.month_start_date_key,
	a13.quarter_start_date_key,
	a13.year_start_date_key,
	a11.incident_key,
	a12.row_key,
	a11.sequence_id,
	a11.reported_type_src_key,
	a11.opened_on_key,
	a12.created_on,
	a11.business_service_c_key,
	a11.category_src_key


[Analytical engine calculation steps:
]
