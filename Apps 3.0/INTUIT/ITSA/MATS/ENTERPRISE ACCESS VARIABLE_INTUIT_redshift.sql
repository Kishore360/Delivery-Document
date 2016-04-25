SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select 'f_request_item' as  Table_Name,count(a11.row_key) Row_Count
from      ldb.f_request_item        a11
           union
		   select  'd_configuration_item'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11   
		   			   join        ldb.d_configuration_item            a12
                  on         (a11.configuration_item_key = a12.row_key)
                 union select  'd_access_application_c'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11 join        ldb.d_access_application_c         a18
                  on         (a11.application_c_key = a18.row_key)
                union select  'd_configuration_application_c'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11 join        ldb.d_configuration_application_c           a19
                  on         (a11.cmdb_ci_c_key = a19.row_key)
                union select  'd_variable_lov_access_action'as Table_Name,count(a11.row_key) Row_Count from 
				ldb.f_request_item 	a11 join        
				ldb.d_variable_lov_c_access_action            a110
                  on         (a11.access_action_c_key = a110.row_key)
                 union select  'd_access_environments_c'as Table_Name,count(a11.row_key) Row_Count from 
				ldb.f_request_item 	a11 join        ldb.d_access_environments_c  a113
                  on         (a11.environment_c_key = a113.row_key)
                union select  'd_request'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11 join        ldb.d_request   a114
                  on         (a11.request_key = a114.row_key)
                union select  'd_internal_organization_group_request_task_assignment_group_c'as Table_Name,count(a11.row_key) Row_Count from ldb.f_request_item 	a11 join        ldb.d_internal_organization_group_request_task_assignment_group_c              a117
                  on         (a11.request_task_assignment_group_c_key = a117.row_key)
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