Report: Incident Keyword Analysis
Job: 44719
Report Cache Used: No

Number of Columns Returned:		57
Number of Temp Tables:		0

Total Number of Passes:		1
Number of SQL Passes:		1
Number of Analytical Passes:		0

Tables Accessed:
d_calendar_date
d_calendar_month
d_configuration_item
d_customer
d_customer_mdm
d_incident
d_internal_organization_department
d_internal_organization_group
d_task_priority
dh_assignment_group_tier_hierarchy
dh_assignment_group_type_hierarchy
f_incident
f_incident_keyword


SQL Statements:

select	a18.day_of_year AS day_of_year,
	a18.week_day_flag AS week_day_flag,
	a11.incident_key AS incident_key,
	max(a19.source_url) AS CustCol_164,
	a11.configuration_item_key AS configuration_item_key,
	max(a17.name) AS name,
	a11.assignment_group_key AS assignment_group_key,
	max(a110.organization_name) AS organization_name,
	a19.backlog_flag AS backlog_flag,
	a19.problem_flag AS problem_flag,
	a19.knowledge_flag AS knowledge_flag,
	a19.met_sla_flag AS met_sla_flag,
	a19.multiple_assignment_flag AS multiple_assignment_flag,
	a19.reopened_flag AS reopened_flag,
	a19.priority_escalated_flag AS priority_escalated_flag,
	a11.opened_on_key AS calendar_date_key,
	max(TO_CHAR(a18.calendar_date,'MM/DD')) AS CustCol,
	a11.priority_src_key AS priority_src_key,
	max(a112.source_dimension_name) AS source_dimension_name,
	a18.month_start_date_key AS month_start_date_key,
	max(a18.month_name) AS month_name,
	a18.week_start_date_key AS row_key0,
	max(a18.week_number_of_year) AS week_number_of_year,
	a18.year_start_date_key AS row_key1,
	max(a18.year_name) AS year_name,
	a14.row_key AS opened_by_department_key,
	max(a14.organization_name) AS organization_name0,
	a19.row_key AS row_key2,
	max(a19.short_description) AS short_description,
	a17.ci_type AS ci_type,
	a13.row_current_key AS row_current_key,
	max(a111.name) AS organization_name1,
	a18.quarter_start_date_key AS row_key3,
	max(a18.quarter_name) AS quarter_name,
	a17.class AS class,
	a17.category AS category,
	a17.ci_team AS ci_team,
	a13.customer_contact1_name AS customer_contact1_name,
	a13.customer_contact2_name AS customer_contact2_name,
	a19.cause_code AS cause_code,
	a16.user_group_type_level1_key AS user_group_type_level1_key,
	a19.caused_by_change_flag AS caused_by_change_flag,
	a19.is_caused_by_task_flag AS is_caused_by_task_flag,
	a15.user_group_tier_level1_key AS user_group_tier_level1_key,
	a19.exclude_flag AS exclude_flag,
	a19.pending_reason AS pending_reason,
	a18.day_of_month AS day_of_month,
	a18.day_of_week AS day_of_week,
	max(a18.day_name) AS week_day_flag0,
	a18.day_name AS day_name0,
	a19.sox_compliance_c_flag AS sox_compliance_flag_c,
	a19.issue_type_c AS issue_type_c,
	a19.incident_type AS incident_type,
	a19.resolvable_by_c AS resolvable_by_c,
	a110.group_type_c AS group_type_c,
	a12.keyword AS keyword,
	count(a11.row_key) AS WJXBFS1
from	ldb.f_incident	a11
	join	ldb.f_incident_keyword	a12
	  on 	(a11.assignment_group_key = a12.assignment_group_key and 
	a11.configuration_item_key = a12.configuration_item_key and 
	a11.customer_key = a12.customer_key and 
	a11.incident_key = a12.table_row_key and 
	a11.opened_on_key = a12.opened_on_key and 
	a11.priority_src_key = a12.priority_src_key)
	join	ldb.d_customer	a13
	  on 	(a11.customer_key = a13.row_key)
	join	ldb.d_internal_organization_department	a14
	  on 	(a11.opened_by_department_key = a14.row_key)
	join	ldb.dh_assignment_group_tier_hierarchy	a15
	  on 	(a11.assignment_group_key = a15.user_group_tier_key)
	join	ldb.dh_assignment_group_type_hierarchy	a16
	  on 	(a11.assignment_group_key = a16.user_group_type_key)
	join	ldb.d_configuration_item	a17
	  on 	(a11.configuration_item_key = a17.row_key)
	join	ldb.d_calendar_date	a18
	  on 	(a11.opened_on_key = a18.row_key)
	join	ldb.d_incident	a19
	  on 	(a11.incident_key = a19.row_key)
	join	ldb.d_internal_organization_group	a110
	  on 	(a11.assignment_group_key = a110.row_key)
	join	ldb.d_customer_mdm	a111
	  on 	(a13.row_current_key = a111.row_current_key)
	join	ldb.d_task_priority	a112
	  on 	(a11.priority_src_key = a112.row_key)
	join	ldb.d_calendar_month	a113
	  on 	(a18.month_start_date_key = a113.row_key)
where	a113.lagging_count_of_month between 0 and 5
group by	a18.day_of_year,
	a18.week_day_flag,
	a11.incident_key,
	a11.configuration_item_key,
	a11.assignment_group_key,
	a19.backlog_flag,
	a19.problem_flag,
	a19.knowledge_flag,
	a19.met_sla_flag,
	a19.multiple_assignment_flag,
	a19.reopened_flag,
	a19.priority_escalated_flag,
	a11.opened_on_key,
	a11.priority_src_key,
	a18.month_start_date_key,
	a18.week_start_date_key,
	a18.year_start_date_key,
	a14.row_key,
	a19.row_key,
	a17.ci_type,
	a13.row_current_key,
	a18.quarter_start_date_key,
	a17.class,
	a17.category,
	a17.ci_team,
	a13.customer_contact1_name,
	a13.customer_contact2_name,
	a19.cause_code,
	a16.user_group_type_level1_key,
	a19.caused_by_change_flag,
	a19.is_caused_by_task_flag,
	a15.user_group_tier_level1_key,
	a19.exclude_flag,
	a19.pending_reason,
	a18.day_of_month,
	a18.day_of_week,
	a18.day_name,
	a19.sox_compliance_c_flag,
	a19.issue_type_c,
	a19.incident_type,
	a19.resolvable_by_c,
	a110.group_type_c,
	a12.keyword


[Analytical engine calculation steps:
]
