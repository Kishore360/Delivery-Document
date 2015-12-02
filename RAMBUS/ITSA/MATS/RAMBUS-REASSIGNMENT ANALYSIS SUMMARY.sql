Report: Reassignment analysis summary
Job: 44881
Report Cache Used: No

Number of Columns Returned:		19
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
d_task_contacttype
f_incident_reassignment_analysis_summary_c


SQL Statements:

select	a11.assignment_group_key AS assignment_group_key,
	max(a15.organization_name) AS organization_name,
	a11.reported_type_src_key AS row_key,
	max(a18.source_dimension_name) AS source_dimension_name,
	a11.assigned_on_key AS calendar_date_key,
	max(a14.calendar_date) AS calendar_date,
	a14.year_start_date_key AS row_key0,
	max(a14.year_name) AS year_name,
	a11.incident_key AS incident_key,
	max(a12.incident_number) AS incident_number,
	a12.created_on AS created_on,
	a11.sequence_id AS sequence_id,
	a11.opened_on_key AS row_key2,
	max(a13.calendar_date) AS calendar_date0,
	a11.category_src_key AS row_key3,
	max(a17.source_dimension_name) AS source_dimension_name0,
	a11.business_service_c_key AS row_key4,
	max(a16.name) AS name,
	sum(a11.assigned_duration) AS WJXBFS1
from	ldb.f_incident_reassignment_analysis_summary_c	a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_calendar_date_opened	a13
	  on 	(a11.opened_on_key = a13.row_key)
	join	ldb.d_calendar_date	a14
	  on 	(a11.assigned_on_key = a14.row_key)
	join	ldb.d_internal_organization_group	a15
	  on 	(a11.assignment_group_key = a15.row_key)
	join	ldb.d_configuration_item	a16
	  on 	(a11.business_service_c_key = a16.row_key)
	join	ldb.d_incident_category	a17
	  on 	(a11.category_src_key = a17.row_key)
	join	ldb.d_task_contacttype	a18
	  on 	(a11.reported_type_src_key = a18.row_key)
	join	ldb.d_calendar_month_opened	a19
	  on 	(a13.month_start_date_key = a19.row_key)
where	a19.lagging_count_of_month between 0 and 11
group by	a11.assignment_group_key,
	a11.reported_type_src_key,
	a11.assigned_on_key,
	a14.year_start_date_key,
	a11.incident_key,
	a12.created_on,
	a11.sequence_id,
	a11.opened_on_key,
	a11.category_src_key,
	a11.business_service_c_key


[Analytical engine calculation steps:
]
