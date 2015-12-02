Report: ITSM_Problem
Job: 44826
Report Cache Used: No

Number of Columns Returned:		48
Number of Temp Tables:		0

Total Number of Passes:		1
Number of SQL Passes:		1
Number of Analytical Passes:		0

Tables Accessed:
d_calendar_date
d_calendar_time
d_configuration_item
d_internal_contact
d_internal_contact_mdm
d_internal_organization_group
d_problem
d_problem_category
d_problem_state
d_problem_subcategory
d_task_contacttype
d_task_priority
d_task_urgency
f_problem


SQL Statements:

select	a14.known_error_flag AS known_error_flag,
	a13.hour_24_format_num AS hour_24_format_num,
	max(a13.hour_24_format_char) AS hour_24_format_char,
	a11.configuration_item_key AS configuration_item_key,
	max(a18.name) AS name,
	a11.opened_on_key AS calendar_date_key,
	max(a19.calendar_date) AS calendar_date,
	a12.row_current_key AS row_current_key,
	max(a110.full_name) AS full_name,
	max(a110.vip_flag) AS vip_flag,
	max(a110.identification_number) AS identification_number,
	a11.assignment_group_key AS assignment_group_key,
	max(a16.organization_name) AS organization_name,
	a11.problem_key AS problem_key,
	max(a14.source_url) AS CustCol_165,
	a11.assigned_to_key AS row_key0,
	max(a15.full_name) AS full_name0,
	max('<img src='+chr(34)+'../images/Numerify/EMP_IMAGES/'+(a15.first_name)+(a15.last_name)+'.jpg'+chr(34)+'/>') AS CustCol_1340,
	a11.priority_src_key AS priority_src_key,
	max(a116.source_dimension_name) AS source_dimension_name,
	a11.urgency_src_key AS urgency_src_key,
	max(a118.source_dimension_name) AS source_dimension_name0,
	a11.state_src_key AS row_key1,
	max(a113.source_dimension_code) AS source_dimension_code1,
	max(a113.source_dimension_name) AS source_dimension_name1,
	a14.short_description AS short_description,
	a11.reported_type_src_key AS row_key2,
	max(a117.source_dimension_name) AS source_dimension_name2,
	a11.confidentiality_src_code_c AS confidentiality_c,
	a14.problem_type_c AS problem_type_c,
	a11.integrity_src_code_c AS integrity_c,
	a11.sub_category_src_key AS row_key3,
	max(a114.source_dimension_name) AS source_dimension_name3,
	a11.category_src_key AS row_key4,
	max(a111.source_dimension_name) AS source_dimension_name4,
	a14.on_hold_type_c AS on_hold_type_c,
	a11.availability_src_code_c AS availability_c,
	a14.major_problem_c_flag AS major_problem_flag_c,
	a11.business_service_c_key AS row_key5,
	max(a17.name) AS name0,
	a11.problem_manager_c_key AS row_key6,
	max(a112.full_name) AS full_name1,
	a11.requestor_c_key AS row_key7,
	max(a115.full_name) AS full_name2,
	a14.pva_c AS pva_c,
	TO_CHAR(a14.major_problem_on_c,'MM/DD/YYYY hh24:mi:ss') AS major_problem_on_c,
	TO_CHAR(a14.workaround_on_c,'MM/DD/YYYY hh24:mi:ss') AS workaround_on_c,
	count(a11.row_key) AS WJXBFS1
from	ldb.f_problem	a11
	left outer join	ldb.d_internal_contact	a12
	  on 	(a11.opened_by_key = a12.row_key)
	left outer join	ldb.d_calendar_time	a13
	  on 	(a11.opened_time_key = a13.row_key)
	left outer join	ldb.d_problem	a14
	  on 	(a11.problem_key = a14.row_key)
	left outer join	ldb.d_internal_contact	a15
	  on 	(a11.assigned_to_key = a15.row_key)
	left outer join	ldb.d_internal_organization_group	a16
	  on 	(a11.assignment_group_key = a16.row_key)
	left outer join	ldb.d_configuration_item	a17
	  on 	(a11.business_service_c_key = a17.row_key)
	left outer join	ldb.d_configuration_item	a18
	  on 	(a11.configuration_item_key = a18.row_key)
	left outer join	ldb.d_calendar_date	a19
	  on 	(a11.opened_on_key = a19.row_key)
	left outer join	ldb.d_internal_contact_mdm	a110
	  on 	(a12.row_current_key = a110.row_current_key)
	left outer join	ldb.d_problem_category	a111
	  on 	(a11.category_src_key = a111.row_key)
	left outer join	ldb.d_internal_contact	a112
	  on 	(a11.problem_manager_c_key = a112.row_key)
	left outer join	ldb.d_problem_state	a113
	  on 	(a11.state_src_key = a113.row_key)
	left outer join	ldb.d_problem_subcategory	a114
	  on 	(a11.sub_category_src_key = a114.row_key)
	left outer join	ldb.d_internal_contact	a115
	  on 	(a11.requestor_c_key = a115.row_key)
	left outer join	ldb.d_task_priority	a116
	  on 	(a11.priority_src_key = a116.row_key)
	left outer join	ldb.d_task_contacttype	a117
	  on 	(a11.reported_type_src_key = a117.row_key)
	left outer join	ldb.d_task_urgency	a118
	  on 	(a11.urgency_src_key = a118.row_key)
group by	a14.known_error_flag,
	a13.hour_24_format_num,
	a11.configuration_item_key,
	a11.opened_on_key,
	a12.row_current_key,
	a11.assignment_group_key,
	a11.problem_key,
	a11.assigned_to_key,
	a11.priority_src_key,
	a11.urgency_src_key,
	a11.state_src_key,
	a14.short_description,
	a11.reported_type_src_key,
	a11.confidentiality_src_code_c,
	a14.problem_type_c,
	a11.integrity_src_code_c,
	a11.sub_category_src_key,
	a11.category_src_key,
	a14.on_hold_type_c,
	a11.availability_src_code_c,
	a14.major_problem_c_flag,
	a11.business_service_c_key,
	a11.problem_manager_c_key,
	a11.requestor_c_key,
	a14.pva_c,
	TO_CHAR(a14.major_problem_on_c,'MM/DD/YYYY hh24:mi:ss'),
	TO_CHAR(a14.workaround_on_c,'MM/DD/YYYY hh24:mi:ss')


[Analytical engine calculation steps:
]
