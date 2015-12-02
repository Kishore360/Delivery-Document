Report: ITSM_Change
Job: 44765
Report Cache Used: No

Number of Columns Returned:		72
Number of Temp Tables:		0

Total Number of Passes:		1
Number of SQL Passes:		1
Number of Analytical Passes:		0

Tables Accessed:
d_calendar_date
d_calendar_month
d_calendar_quarter
d_calendar_year
d_change_request
d_change_request_category
d_change_request_implementation_state_c
d_change_request_reason
d_change_request_review_status
d_change_request_risk
d_change_request_scope
d_change_request_souce_of_change
d_change_request_state
d_change_request_subcategory
d_change_request_type
d_configuration_item
d_domain
d_internal_contact
d_internal_contact_mdm
d_internal_organization_department
d_internal_organization_group
d_location
d_task_contacttype
d_task_impact
d_task_priority
d_task_urgency
f_change_request_closed


SQL Statements:

select	a11.change_request_key AS row_key,
	max(a14.change_request_number) AS row_id,
	a14.not_on_time_flag AS met_sla_flag,
	a11.reason_src_key AS row_key0,
	max(a110.source_dimension_code) AS source_dimension_code,
	a14.rescheduled_flag AS met_sla_flag0,
	a11.review_status_src_key AS row_key1,
	max(a112.source_dimension_name) AS source_dimension_code0,
	a11.risk_src_key AS row_key2,
	max(a113.source_dimension_name) AS source_dimension_name,
	a11.scope_src_key AS row_key3,
	max(a114.source_dimension_name) AS source_dimension_name0,
	a11.type_src_key AS row_key4,
	max(a115.source_dimension_name) AS source_dimension_name1,
	a14.unplanned_flag AS met_sla_flag1,
	a14.production_change_flag AS met_sla_flag2,
	a14.active_flag AS met_sla_flag3,
	a11.category_src_key AS row_key5,
	max(a19.source_dimension_name) AS source_dimension_name2,
	a14.short_description AS description,
	a14.emergency_flag AS met_sla_flag4,
	a14.failure_flag AS met_sla_flag5,
	a14.met_sla_flag AS met_sla_flag6,
	a11.closed_on_key AS calendar_date_key,
	max(TO_CHAR(a15.calendar_date,'MM/DD')) AS CustCol,
	a15.week_start_date_key AS row_key6,
	max(a15.week_name) AS week_name,
	a15.month_start_date_key AS month_start_date_key,
	max(a15.month_name) AS month_name,
	a13.row_current_key AS row_current_key,
	max(a118.full_name) AS full_name,
	a12.row_key AS opened_by_department_key,
	max(a12.organization_name) AS organization_name,
	a11.urgency_src_key AS urgency_src_key,
	max(a126.source_dimension_name) AS source_dimension_name3,
	a11.priority_src_key AS priority_src_key,
	max(a124.source_dimension_name) AS source_dimension_name4,
	a11.impact_src_key AS impact_src_key,
	max(a122.source_dimension_name) AS source_dimension_name5,
	a11.location_key AS row_key7,
	max(a123.location_name) AS location_name,
	a11.reported_type_src_key AS row_key8,
	max(a125.source_dimension_name) AS source_dimension_name6,
	a11.assignment_group_key AS assignment_group_key,
	max(a17.organization_name) AS organization_name0,
	a11.assigned_to_key AS row_key9,
	max(a16.full_name) AS full_name0,
	a11.configuration_item_key AS configuration_item_key,
	max(a116.name) AS name,
	a11.domain_key AS row_key10,
	max(a117.domain_name) AS domain_name,
	a11.souce_of_change_src_c_key AS row_key11,
	max(a120.source_dimension_name) AS source_dimension_name7,
	a11.business_service_c_key AS row_key12,
	max(a18.name) AS name0,
	a14.rejected_change_c_flag AS rejected_change_c_flag,
	a14.issue_type_c AS issue_type_c,
	a14.sox_compliance_c_flag AS sox_compliance_flag_c,
	a11.sub_category_src_c_key AS row_key13,
	max(a121.source_dimension_name) AS source_dimension_name8,
	a11.implementation_state_src_c_key AS row_key14,
	max(a119.source_dimension_name) AS source_dimension_name9,
	a11.state_src_key AS row_key15,
	max(a111.source_dimension_name) AS source_dimension_name10,
	a15.quarter_start_date_key AS row_key16,
	max(a15.quarter_name) AS quarter_name,
	max(a15.quarter_number_of_year) AS quarter_number_of_year,
	max(a128.lagging_count_of_quarter) AS lagging_count_of_quarter,
	a15.year_start_date_key AS row_key17,
	max(a15.year_name) AS year_name,
	max(a129.lagging_count_of_year) AS lagging_count_of_year,
	count(distinct a11.change_request_key) AS WJXBFS1
from	ldb.f_change_request_closed	a11
	join	ldb.d_internal_organization_department	a12
	  on 	(a11.requested_by_department_key = a12.row_key)
	join	ldb.d_internal_contact	a13
	  on 	(a11.opened_by_key = a13.row_key)
	join	ldb.d_change_request	a14
	  on 	(a11.change_request_key = a14.row_key)
	join	ldb.d_calendar_date	a15
	  on 	(a11.closed_on_key = a15.row_key)
	join	ldb.d_internal_contact	a16
	  on 	(a11.assigned_to_key = a16.row_key)
	join	ldb.d_internal_organization_group	a17
	  on 	(a11.assignment_group_key = a17.row_key)
	join	ldb.d_configuration_item	a18
	  on 	(a11.business_service_c_key = a18.row_key)
	join	ldb.d_change_request_category	a19
	  on 	(a11.category_src_key = a19.row_key)
	join	ldb.d_change_request_reason	a110
	  on 	(a11.reason_src_key = a110.row_key)
	join	ldb.d_change_request_state	a111
	  on 	(a11.state_src_key = a111.row_key)
	join	ldb.d_change_request_review_status	a112
	  on 	(a11.review_status_src_key = a112.row_key)
	join	ldb.d_change_request_risk	a113
	  on 	(a11.risk_src_key = a113.row_key)
	join	ldb.d_change_request_scope	a114
	  on 	(a11.scope_src_key = a114.row_key)
	join	ldb.d_change_request_type	a115
	  on 	(a11.type_src_key = a115.row_key)
	join	ldb.d_configuration_item	a116
	  on 	(a11.configuration_item_key = a116.row_key)
	join	ldb.d_domain	a117
	  on 	(a11.domain_key = a117.row_key)
	join	ldb.d_internal_contact_mdm	a118
	  on 	(a13.row_current_key = a118.row_current_key)
	join	ldb.d_change_request_implementation_state_c	a119
	  on 	(a11.implementation_state_src_c_key = a119.row_key)
	join	ldb.d_change_request_souce_of_change	a120
	  on 	(a11.souce_of_change_src_c_key = a120.row_key)
	join	ldb.d_change_request_subcategory	a121
	  on 	(a11.sub_category_src_c_key = a121.row_key)
	join	ldb.d_task_impact	a122
	  on 	(a11.impact_src_key = a122.row_key)
	join	ldb.d_location	a123
	  on 	(a11.location_key = a123.row_key)
	join	ldb.d_task_priority	a124
	  on 	(a11.priority_src_key = a124.row_key)
	join	ldb.d_task_contacttype	a125
	  on 	(a11.reported_type_src_key = a125.row_key)
	join	ldb.d_task_urgency	a126
	  on 	(a11.urgency_src_key = a126.row_key)
	join	ldb.d_calendar_month	a127
	  on 	(a15.month_start_date_key = a127.row_key)
	join	ldb.d_calendar_quarter	a128
	  on 	(a15.quarter_start_date_key = a128.row_key)
	join	ldb.d_calendar_year	a129
	  on 	(a15.year_start_date_key = a129.row_key)
where	(a14.failure_flag = 'N'
 and a127.lagging_count_of_month between 0 and 11)
group by	a11.change_request_key,
	a14.not_on_time_flag,
	a11.reason_src_key,
	a14.rescheduled_flag,
	a11.review_status_src_key,
	a11.risk_src_key,
	a11.scope_src_key,
	a11.type_src_key,
	a14.unplanned_flag,
	a14.production_change_flag,
	a14.active_flag,
	a11.category_src_key,
	a14.short_description,
	a14.emergency_flag,
	a14.failure_flag,
	a14.met_sla_flag,
	a11.closed_on_key,
	a15.week_start_date_key,
	a15.month_start_date_key,
	a13.row_current_key,
	a12.row_key,
	a11.urgency_src_key,
	a11.priority_src_key,
	a11.impact_src_key,
	a11.location_key,
	a11.reported_type_src_key,
	a11.assignment_group_key,
	a11.assigned_to_key,
	a11.configuration_item_key,
	a11.domain_key,
	a11.souce_of_change_src_c_key,
	a11.business_service_c_key,
	a14.rejected_change_c_flag,
	a14.issue_type_c,
	a14.sox_compliance_c_flag,
	a11.sub_category_src_c_key,
	a11.implementation_state_src_c_key,
	a11.state_src_key,
	a15.quarter_start_date_key,
	a15.year_start_date_key


[Analytical engine calculation steps:
]
