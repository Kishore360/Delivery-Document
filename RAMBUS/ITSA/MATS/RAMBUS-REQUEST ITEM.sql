Report: ITSM_Request Item
Job: 44854
Report Cache Used: No

Number of Columns Returned:		53
Number of Temp Tables:		0

Total Number of Passes:		1
Number of SQL Passes:		1
Number of Analytical Passes:		0

Tables Accessed:
d_calendar_date
d_calendar_date_closed
d_calendar_month
d_calendar_month_closed
d_internal_contact
d_internal_contact_mdm
d_internal_contact_requested_for
d_internal_contact_task_closed_by
d_internal_organization_group
d_master_item
d_request
d_request_item
d_request_item_stage
d_request_item_state
d_task_approval
f_request_item


SQL Statements:

select	a15.quarter_start_date_key AS row_key,
	max(a15.quarter_name) AS quarter_name,
	a15.week_start_date_key AS row_key0,
	max(a15.week_name) AS week_name,
	a15.year_start_date_key AS row_key1,
	max(a15.year_name) AS year_name,
	a11.approval_state_src_key AS row_key2,
	max(a114.source_dimension_name) AS source_dimension_name,
	a11.assigned_to_key AS row_key3,
	max(a17.full_name) AS full_name,
	a11.assignment_group_key AS assignment_group_key,
	max(a18.organization_name) AS organization_name,
	a11.opened_on_key AS calendar_date_key,
	max(a16.calendar_date) AS calendar_date,
	a16.month_start_date_key AS month_start_date_key,
	max(a16.month_name) AS month_name,
	a16.quarter_start_date_key AS row_key4,
	max(a16.quarter_name) AS quarter_name0,
	a16.week_start_date_key AS row_key5,
	max(a16.week_name) AS week_name0,
	a16.year_start_date_key AS row_key6,
	max(a16.year_name) AS year_name0,
	a11.closed_by_key AS row_key7,
	max(a115.full_name) AS full_name0,
	a11.request_item_key AS request_item_key,
	max(a14.source_url) AS source_url,
	a14.over_due_flag AS over_due_flag,
	a11.request_key AS row_key9,
	max(a110.source_url) AS source_url0,
	a11.closed_on_key AS row_key11,
	max(a15.calendar_date) AS calendar_date0,
	a15.month_start_date_key AS row_key12,
	max(a117.month_name) AS month_name0,
	a13.item_number AS item_number,
	max(a13.item_name) AS item_name,
	a12.row_current_key AS row_current_key,
	max(a19.full_name) AS full_name1,
	a13.item_category AS item_category0,
	a14.due_on AS Due_On_MM_DD,
	a13.item_type_code AS item_type_code0,
	a14.backordered_flag AS backordered_flag,
	a14.estimated_delivery AS estimated_delivery,
	max(TO_CHAR(a14.estimated_delivery,'MM/DD')) AS CustCol_170,
	a11.stage_src_key AS row_key13,
	max(a111.source_dimension_name) AS source_dimension_name0,
	a11.requested_for_key AS row_key14,
	max(a113.full_name) AS full_name2,
	a11.state_src_key AS state_src_key,
	max(a112.source_dimension_code) AS source_dimension_code1,
	max(a112.source_dimension_name) AS source_dimension_name1,
	a14.new_hire_sla_c_flag AS new_hire_sla_flag_c,
	a12.group_level_c AS group_level_c,
	count(a11.row_key) AS WJXBFS1
from	ldb.f_request_item	a11
	left outer join	ldb.d_internal_contact	a12
	  on 	(a11.opened_by_key = a12.row_key)
	left outer join	ldb.d_master_item	a13
	  on 	(a11.catalog_item_key = a13.row_key)
	left outer join	ldb.d_request_item	a14
	  on 	(a11.request_item_key = a14.row_key)
	left outer join	ldb.d_calendar_date_closed	a15
	  on 	(a11.closed_on_key = a15.row_key)
	left outer join	ldb.d_calendar_date	a16
	  on 	(a11.opened_on_key = a16.row_key)
	left outer join	ldb.d_internal_contact	a17
	  on 	(a11.assigned_to_key = a17.row_key)
	left outer join	ldb.d_internal_organization_group	a18
	  on 	(a11.assignment_group_key = a18.row_key)
	left outer join	ldb.d_internal_contact_mdm	a19
	  on 	(a12.row_current_key = a19.row_current_key)
	left outer join	ldb.d_request	a110
	  on 	(a11.request_key = a110.row_key)
	left outer join	ldb.d_request_item_stage	a111
	  on 	(a11.stage_src_key = a111.row_key)
	left outer join	ldb.d_request_item_state	a112
	  on 	(a11.state_src_key = a112.row_key)
	left outer join	ldb.d_internal_contact_requested_for	a113
	  on 	(a11.requested_for_key = a113.row_key)
	left outer join	ldb.d_task_approval	a114
	  on 	(a11.approval_state_src_key = a114.row_key)
	left outer join	ldb.d_internal_contact_task_closed_by	a115
	  on 	(a11.closed_by_key = a115.row_key)
	left outer join	ldb.d_calendar_month	a116
	  on 	(a16.month_start_date_key = a116.row_key)
	left outer join	ldb.d_calendar_month_closed	a117
	  on 	(a15.month_start_date_key = a117.row_key)
where	(a116.lagging_count_of_month between 0 and 11
 or a117.lagging_count_of_month between 0 and 11)
group by	a15.quarter_start_date_key,
	a15.week_start_date_key,
	a15.year_start_date_key,
	a11.approval_state_src_key,
	a11.assigned_to_key,
	a11.assignment_group_key,
	a11.opened_on_key,
	a16.month_start_date_key,
	a16.quarter_start_date_key,
	a16.week_start_date_key,
	a16.year_start_date_key,
	a11.closed_by_key,
	a11.request_item_key,
	a14.over_due_flag,
	a11.request_key,
	a11.closed_on_key,
	a15.month_start_date_key,
	a13.item_number,
	a12.row_current_key,
	a13.item_category,
	a14.due_on,
	a13.item_type_code,
	a14.backordered_flag,
	a14.estimated_delivery,
	a11.stage_src_key,
	a11.requested_for_key,
	a11.state_src_key,
	a14.new_hire_sla_c_flag,
	a12.group_level_c


[Analytical engine calculation steps:
]
