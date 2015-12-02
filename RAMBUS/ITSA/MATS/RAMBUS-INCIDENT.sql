Report: ITSM_Incident
Job: 44793
Report Cache Used: No

Number of Columns Returned:		95
Number of Temp Tables:		0

Total Number of Passes:		1
Number of SQL Passes:		1
Number of Analytical Passes:		0

Tables Accessed:
d_adhoc_request_c
d_calendar_date
d_calendar_month
d_calendar_time
d_configuration_item
d_customer
d_customer_mdm
d_domain
d_incident
d_incident_category
d_incident_close_code
d_incident_severity
d_incident_state
d_incident_subcategory
d_internal_contact
d_internal_contact_mdm
d_internal_organization_department
d_internal_organization_group
d_internal_organization_legalentity
d_location
d_task_contacttype
d_task_impact
d_task_priority
d_task_urgency
dh_assignment_group_tier_hierarchy
dh_assignment_group_type_hierarchy
f_incident


SQL Statements:

select	a110.day_of_year AS day_of_year,
	a110.week_day_flag AS week_day_flag,
	a11.domain_key AS row_key,
	max(a117.domain_name) AS domain_name,
	a11.incident_key AS incident_key,
	max(a111.source_url) AS CustCol_164,
	a12.row_current_key AS row_current_key,
	max(a118.full_name) AS full_name,
	a11.assigned_to_key AS row_key1,
	max(a114.full_name) AS full_name0,
	a16.hour_24_format_num AS hour_24_format_num,
	max(a16.hour_24_format_char) AS hour_24_format_char,
	a11.configuration_item_key AS configuration_item_key,
	max(a19.name) AS name,
	a11.assignment_group_key AS assignment_group_key,
	max(a112.organization_name) AS organization_name,
	a111.backlog_flag AS backlog_flag,
	a111.problem_flag AS problem_flag,
	a111.knowledge_flag AS knowledge_flag,
	a111.met_sla_flag AS met_sla_flag,
	a111.multiple_assignment_flag AS multiple_assignment_flag,
	a111.reopened_flag AS reopened_flag,
	a111.priority_escalated_flag AS priority_escalated_flag,
	a11.opened_on_key AS calendar_date_key,
	max(TO_CHAR(a110.calendar_date,'MM/DD')) AS CustCol,
	a11.impact_src_key AS impact_src_key,
	max(a124.source_dimension_code) AS source_dimension_code,
	max(a124.source_dimension_name) AS source_dimension_name,
	a11.priority_src_key AS priority_src_key,
	max(a126.source_dimension_code) AS source_dimension_code0,
	max(a126.source_dimension_name) AS source_dimension_name0,
	a11.urgency_src_key AS urgency_src_key,
	max(a128.source_dimension_code) AS source_dimension_code1,
	max(a128.source_dimension_name) AS source_dimension_name1,
	a11.category_src_key AS row_key2,
	max(a119.source_dimension_name) AS source_dimension_name2,
	a11.severity_src_key AS severity_src_key,
	max(a120.source_dimension_code) AS source_dimension_code3,
	max(a120.source_dimension_name) AS source_dimension_name3,
	a11.state_src_key AS state_src_key,
	max(a121.source_dimension_code) AS source_dimension_code4,
	max(a121.source_dimension_name) AS source_dimension_name4,
	a110.month_start_date_key AS month_start_date_key,
	max(a110.month_name) AS month_name,
	a110.week_start_date_key AS row_key3,
	max(a110.week_number_of_year) AS week_number_of_year,
	a110.year_start_date_key AS row_key4,
	max(a110.year_name) AS year_name,
	a15.row_key AS opened_by_department_key,
	max(a15.organization_name) AS organization_name0,
	a111.row_key AS row_key5,
	max(a111.short_description) AS short_description,
	a11.location_key AS row_key6,
	max(a125.location_name) AS location_name,
	a11.reported_type_src_key AS row_key7,
	max(a127.source_dimension_name) AS source_dimension_name5,
	a11.sub_category_src_key AS sub_category_src_key,
	max(a122.source_dimension_name) AS source_dimension_name6,
	a19.ci_type AS ci_type,
	a14.row_current_key AS row_current_key0,
	max(a116.name) AS organization_name1,
	a110.quarter_start_date_key AS row_key8,
	max(a110.quarter_name) AS quarter_name,
	a19.class AS class,
	a19.category AS category,
	a19.ci_team AS ci_team,
	a14.customer_contact1_name AS customer_contact1_name,
	a14.customer_contact2_name AS customer_contact2_name,
	a111.cause_code AS cause_code,
	a11.close_code_src_key AS close_code_src_key,
	max(a113.source_dimension_code) AS close_code_src_code,
	a18.user_group_type_level1_key AS user_group_type_level1_key,
	a111.caused_by_change_flag AS caused_by_change_flag,
	a111.is_caused_by_task_flag AS is_caused_by_task_flag,
	a17.user_group_tier_level1_key AS user_group_tier_level1_key,
	a111.exclude_flag AS exclude_flag,
	a111.pending_reason AS pending_reason,
	a110.day_of_month AS day_of_month,
	a110.day_of_week AS day_of_week,
	max(a110.day_name) AS week_day_flag0,
	a110.day_name AS day_name0,
	a13.organization_name AS organization_name2,
	a111.sox_compliance_c_flag AS sox_compliance_flag_c,
	a111.issue_type_c AS issue_type_c,
	a11.business_service_c_key AS row_key9,
	max(a115.name) AS name0,
	a111.incident_type AS incident_type,
	a111.resolvable_by_c AS resolvable_by_c,
	a11.service_request_c_key AS row_key10,
	max(a123.request_number) AS request_number,
	a112.group_type_c AS group_type_c,
	case when a113.source_dimension_name = 'Not Solved (Not Reproducible)' then 'Valid'
when a113.source_dimension_name = 'Solved (Permanently)' then 'Valid'
when a113.source_dimension_name = 'Not Solved (Too Costly)' then 'Valid'
when a113.source_dimension_name = 'Solved Remotely (Work Around)' then 'Valid'
when a113.source_dimension_name = 'Solved Remotely (Permanently)' then 'Valid'
when a113.source_dimension_name = 'Solved (Work Around)' then 'Valid'
else 'Invalid' end  AS CustCol_181,
	a12.group_level_c AS group_level_c,
	a12.vip_c_flag AS vip_c_flag,
	count(a11.row_key) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.d_internal_contact	a12
	  on 	(a11.opened_by_key = a12.row_key)
	join	ldb.d_internal_organization_legalentity	a13
	  on 	(a11.company_key = a13.row_key)
	join	ldb.d_customer	a14
	  on 	(a11.customer_key = a14.row_key)
	join	ldb.d_internal_organization_department	a15
	  on 	(a11.opened_by_department_key = a15.row_key)
	join	ldb.d_calendar_time	a16
	  on 	(a11.opened_time_key = a16.row_key)
	join	ldb.dh_assignment_group_tier_hierarchy	a17
	  on 	(a11.assignment_group_key = a17.user_group_tier_key)
	join	ldb.dh_assignment_group_type_hierarchy	a18
	  on 	(a11.assignment_group_key = a18.user_group_type_key)
	join	ldb.d_configuration_item	a19
	  on 	(a11.configuration_item_key = a19.row_key)
	join	ldb.d_calendar_date	a110
	  on 	(a11.opened_on_key = a110.row_key)
	join	ldb.d_incident	a111
	  on 	(a11.incident_key = a111.row_key)
	join	ldb.d_internal_organization_group	a112
	  on 	(a11.assignment_group_key = a112.row_key)
	join	ldb.d_incident_close_code	a113
	  on 	(a11.close_code_src_key = a113.row_key)
	join	ldb.d_internal_contact	a114
	  on 	(a11.assigned_to_key = a114.row_key)
	join	ldb.d_configuration_item	a115
	  on 	(a11.business_service_c_key = a115.row_key)
	join	ldb.d_customer_mdm	a116
	  on 	(a14.row_current_key = a116.row_current_key)
	join	ldb.d_domain	a117
	  on 	(a11.domain_key = a117.row_key)
	join	ldb.d_internal_contact_mdm	a118
	  on 	(a12.row_current_key = a118.row_current_key)
	join	ldb.d_incident_category	a119
	  on 	(a11.category_src_key = a119.row_key)
	join	ldb.d_incident_severity	a120
	  on 	(a11.severity_src_key = a120.row_key)
	join	ldb.d_incident_state	a121
	  on 	(a11.state_src_key = a121.row_key)
	join	ldb.d_incident_subcategory	a122
	  on 	(a11.sub_category_src_key = a122.row_key)
	join	ldb.d_adhoc_request_c	a123
	  on 	(a11.service_request_c_key = a123.row_key)
	join	ldb.d_task_impact	a124
	  on 	(a11.impact_src_key = a124.row_key)
	join	ldb.d_location	a125
	  on 	(a11.location_key = a125.row_key)
	join	ldb.d_task_priority	a126
	  on 	(a11.priority_src_key = a126.row_key)
	join	ldb.d_task_contacttype	a127
	  on 	(a11.reported_type_src_key = a127.row_key)
	join	ldb.d_task_urgency	a128
	  on 	(a11.urgency_src_key = a128.row_key)
	join	ldb.d_calendar_month	a129
	  on 	(a110.month_start_date_key = a129.row_key)
where	a129.lagging_count_of_month between 0 and 24
group by	a110.day_of_year,
	a110.week_day_flag,
	a11.domain_key,
	a11.incident_key,
	a12.row_current_key,
	a11.assigned_to_key,
	a16.hour_24_format_num,
	a11.configuration_item_key,
	a11.assignment_group_key,
	a111.backlog_flag,
	a111.problem_flag,
	a111.knowledge_flag,
	a111.met_sla_flag,
	a111.multiple_assignment_flag,
	a111.reopened_flag,
	a111.priority_escalated_flag,
	a11.opened_on_key,
	a11.impact_src_key,
	a11.priority_src_key,
	a11.urgency_src_key,
	a11.category_src_key,
	a11.severity_src_key,
	a11.state_src_key,
	a110.month_start_date_key,
	a110.week_start_date_key,
	a110.year_start_date_key,
	a15.row_key,
	a111.row_key,
	a11.location_key,
	a11.reported_type_src_key,
	a11.sub_category_src_key,
	a19.ci_type,
	a14.row_current_key,
	a110.quarter_start_date_key,
	a19.class,
	a19.category,
	a19.ci_team,
	a14.customer_contact1_name,
	a14.customer_contact2_name,
	a111.cause_code,
	a11.close_code_src_key,
	a18.user_group_type_level1_key,
	a111.caused_by_change_flag,
	a111.is_caused_by_task_flag,
	a17.user_group_tier_level1_key,
	a111.exclude_flag,
	a111.pending_reason,
	a110.day_of_month,
	a110.day_of_week,
	a110.day_name,
	a13.organization_name,
	a111.sox_compliance_c_flag,
	a111.issue_type_c,
	a11.business_service_c_key,
	a111.incident_type,
	a111.resolvable_by_c,
	a11.service_request_c_key,
	a112.group_type_c,
	case when a113.source_dimension_name = 'Not Solved (Not Reproducible)' then 'Valid'
when a113.source_dimension_name = 'Solved (Permanently)' then 'Valid'
when a113.source_dimension_name = 'Not Solved (Too Costly)' then 'Valid'
when a113.source_dimension_name = 'Solved Remotely (Work Around)' then 'Valid'
when a113.source_dimension_name = 'Solved Remotely (Permanently)' then 'Valid'
when a113.source_dimension_name = 'Solved (Work Around)' then 'Valid'
else 'Invalid' end ,
	a12.group_level_c,
	a12.vip_c_flag


[Analytical engine calculation steps:
]
