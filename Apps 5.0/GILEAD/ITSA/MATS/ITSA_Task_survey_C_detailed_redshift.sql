ldb.f_task_response_c	a11
	join	ldb.d_internal_contact	a12
	  on 	(a11.sent_to_key = a12.row_key)
	join	ldb.d_request_task	a13
	  on 	(a11.request_task_key = a13.row_key)
	join	ldb.d_calendar_date	a14
	  on 	(a11.requested_on_key = a14.row_key)
	join	ldb.d_task	a15
	  on 	(a11.task_unique_key = a15.row_key)
	join	ldb.d_location	a16
	  on 	(a11.location_key = a16.row_key)
	join	ldb.d_survey_question	a17
	  on 	(a11.question_key = a17.row_key)
	join	ldb.d_internal_organization_asst_group_c	a18
	  on 	(a11.asmt_assignment_group_c_key = a18.row_key)
	join	ldb.d_internal_contact_asst_assigned_to_c	a19
	  on 	(a11.asmt_user_c_key = a19.row_key)
	join	ldb.d_internal_contact_assigned_to	a110
	  on 	(a11.assigned_to_key = a110.row_key)
	join	ldb.d_internal_organization_group	a111
	  on 	(a11.assignment_group_key = a111.row_key)
	join	ldb.d_configuration_item_survey_causing_ci_c	a112
	  on 	(a11.causing_ci_c_key = a112.row_key)
	join	ldb.d_internal_organization_department	a113
	  on 	(a11.taken_by_department_key = a113.row_key)
	join	ldb.d_internal_contact_mdm	a114
	  on 	(a12.row_current_key = a114.row_current_key)
	join	ldb.d_internal_contact_request_item_task_response_c	a115
	  on 	(a11.request_task_assigned_to_c_key = a115.row_key)
	join	ldb.d_internal_organization_request_item_task_response_c	a116
	  on 	(a11.request_task_assignment_group_c_key = a116.row_key)
	join	ldb.d_survey	a117
	  on 	(a11.survey_key = a117.row_key)
	join	ldb.d_survey_instance	a118
	  on 	(a11.survey_instance_key = a118.row_key)
	join	ldb.d_survey_state	a119
	  on 	(a11.survey_state_src_key = a119.row_key)
	join	ldb.d_calendar_month	a120
	  on 	(a14.month_start_date_key = a120.row_key)
	join	ldb.d_calendar_week	a121
	  on 	(a14.week_start_date_key = a121.row_key)
	join	ldb.d_location_site_c	a122
	  on 	(a16.site_c_key = a122.row_key)
	join	ldb.d_question_type	a123
	  on 	(a17.question_type_src_key = a123.row_key)
	join	ldb.d_calendar_quarter	a124
	  on 	(a14.quarter_start_date_key = a124.row_key)
	join	ldb.d_calendar_year	a125
	  on 	(a14.year_start_date_key = a125.row_key)
