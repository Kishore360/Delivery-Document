SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select 'f_request_item' as  Table_Name,count(a11.row_key) Row_Count
from      ldb.f_request_item        a11
           union
		   select  'd_configuration_item'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11   
		   			   join        ldb.d_configuration_item            a12
                  on         (a11.configuration_item_key = a12.row_key)
                union
				select  'd_internal_contact'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11
				join        ldb.d_internal_contact  a13
                  on         (a11.opened_by_key = a13.row_key)
				  				  union select  'd_internal_contact_mdm'as Table_Name,count(a11.row_key) Row_Count from 
				ldb.f_request_item 	a11 
				join        ldb.d_internal_contact  a13
                  on         (a11.opened_by_key = a13.row_key)
				join        ldb.d_internal_contact_mdm    a112
                  on         (a13.row_current_key = a112.row_current_key)
                union
				select  'd_master_item'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11
				join        ldb.d_master_item         a14
                  on         (a11.catalog_item_key = a14.row_key)
                union select  'd_request_item'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11
				join        ldb.d_request_item       a15
                  on         (a11.request_item_key = a15.row_key)
                union select  'd_calendar_date_closed'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11
				join        ldb.d_calendar_date_closed      a16
                  on         (a11.closed_on_key = a16.row_key)
                union select  'd_calendar_date'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11
				join        ldb.d_calendar_date      a17
                  on         (a11.opened_on_key = a17.row_key)
                union select  'd_access_application_c'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11 join        ldb.d_access_application_c         a18
                  on         (a11.application_c_key = a18.row_key)
                union select  'd_configuration_application_c'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11 join        ldb.d_configuration_application_c           a19
                  on         (a11.cmdb_ci_c_key = a19.row_key)
                union select  'd_variable_lov_access_action'as Table_Name,count(a11.row_key) Row_Count from 
				ldb.f_request_item 	a11 join        
				ldb.d_variable_lov_c_access_action            a110
                  on         (a11.access_action_c_key = a110.row_key)
                union select  'd_internal_contact'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 
				a11 join        ldb.d_internal_contact  a111
                  on         (a11.assigned_to_key = a111.row_key)
                                union select  'd_access_environments_c'as Table_Name,count(a11.row_key) Row_Count from 
				ldb.f_request_item 	a11 join        ldb.d_access_environments_c  a113
                  on         (a11.environment_c_key = a113.row_key)
                union select  'd_request'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11 join        ldb.d_request   a114
                  on         (a11.request_key = a114.row_key)
                union select  'd_request_item_stage'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11 join        ldb.d_request_item_stage         a115
                  on         (a11.stage_src_key = a115.row_key)
                union select  'd_request_item_state'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11 join        ldb.d_request_item_state          a116
                  on         (a11.state_src_key = a116.row_key)
                union select  'd_internal_organization_group_request_task_assignment_group_c'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11 join        ldb.d_internal_organization_group_request_task_assignment_group_c              a117
                  on         (a11.request_task_assignment_group_c_key = a117.row_key)
                union select  'd_internal_contact_requested_for'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11 join        ldb.d_internal_contact_requested_for a118
                  on         (a11.requested_for_key = a118.row_key)
                union select  'd_task_approval'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11 join        ldb.d_task_approval      a119
                  on         (a11.approval_state_src_key = a119.row_key)
                union select  'd_internal_contact_task_closed_by'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11 join        ldb.d_internal_contact_task_closed_by               a120
                  on         (a11.closed_by_key = a120.row_key)
                union select  'd_calendar_month'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11
					join        ldb.d_calendar_date      a17
                  on         (a11.opened_on_key = a17.row_key)
				join        ldb.d_calendar_month a121
                  on         (a17.month_start_date_key = a121.row_key)
                union select  'd_internal_organization_group_request_item_c'as Table_Name,count(a11.row_key) Row_Count
				from ldb.f_request_item 	a11    
				join        ldb.d_configuration_application_c           a19
                  on         (a11.cmdb_ci_c_key = a19.row_key)
				join ldb.d_internal_organization_group_request_item_c      a122
                  on         (a19.support_group_key = a122.row_key)
                union select  'd_calendar_week'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11
				join        ldb.d_calendar_date      a17
                  on         (a11.opened_on_key = a17.row_key)
				join        ldb.d_calendar_week    a123
                  on         (a17.week_start_date_key = a123.row_key)
                union select  'd_calendar_month_closed'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item a11
				join        ldb.d_calendar_date_closed      a16
                  on         (a11.closed_on_key = a16.row_key)
				 join        ldb.d_calendar_month_closed  a124
                  on         (a16.month_start_date_key = a124.row_key)
                union select  'd_calendar_quarter'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11 
				join        ldb.d_calendar_date      a17
                  on         (a11.opened_on_key = a17.row_key)
				join        ldb.d_calendar_quarter                a125
                  on         (a17.quarter_start_date_key = a125.row_key)
                union select  'd_calendar_year'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11
				join        ldb.d_calendar_date      a17
                  on         (a11.opened_on_key = a17.row_key)
				join        ldb.d_calendar_year      a126
                  on         (a17.year_start_date_key = a126.row_key)
)a
)b