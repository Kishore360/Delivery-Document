select 'f_time_entry' as  Table_Name,count(a11.row_key) Row_Count
from      ldb.f_time_entry             a11
                union select  'd_internal_contact_mdm'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11  join        ldb.d_internal_contact_mdm    a12
                  on         (a11.user_key = a12.row_current_key)
                union select  'd_calendar_greg_fiscal_c'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11
				join        ldb.d_calendar_greg_fiscal_c     a13
                  on         (a11.date_key = a13.greogrian_calendar_key)
                union select  'd_calendar_date_fiscal'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11 
				join        ldb.d_calendar_greg_fiscal_c     a13
                  on         (a11.date_key = a13.greogrian_calendar_key)
				join        ldb.d_calendar_date_fiscal         a14
                  on         (a13.fiscal_key = a14.row_key)
                union select  'd_calendar_date'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11  join      
				ldb.d_calendar_date      a15
                  on         (a11.date_key = a15.row_key)
                union select  'd_project'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11  join      
				ldb.d_project    a16
                  on         (a11.project_key = a16.row_key)
                union select  'd_internal_contact_it_director_c'as Table_Name,count(a11.row_key) Row_Count from 
				ldb.f_time_entry 	a11  
				join ldb.d_project    a16
                  on         (a11.project_key = a16.row_key)
				join        ldb.d_internal_contact_it_director_c     a17
                  on         (a16.it_director_c_key = a17.it_director_c_key)
                union select  'dh_employee_hierarchy'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11 
				join	ldb.d_internal_contact_mdm	a12
	  on 	(a11.user_key = a12.row_current_key)
				join        ldb.dh_employee_hierarchy      a18
                  on         (a12.row_dn_key = a18.lev_0_key)
                union select  'd_calendar_fiscal_quarter'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11  
					join	ldb.d_calendar_greg_fiscal_c	a13
	  on 	(a11.date_key = a13.greogrian_calendar_key)
				join	ldb.d_calendar_date_fiscal	a14
	  on 	(a13.fiscal_key = a14.row_key)
				join        ldb.d_calendar_fiscal_quarter   a19
                  on         (a14.quarter_start_date_key = a19.row_key)
                union select  'd_task'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11  join     
				ldb.d_task           a110
                  on         (a11.task_key = a110.row_key)
                union select  'd_internal_organization_legalentity'as Table_Name,count(a11.row_key) Row_Count from
				ldb.f_time_entry 	a11  
				 join        ldb.d_internal_contact_mdm    a12
                  on         (a11.user_key = a12.row_current_key)
				  join        ldb.d_internal_organization_legalentity                a111
                  on         (a12.company_c_key = a111.row_key)
                union select  'd_configuration_item'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11  join        ldb.d_configuration_item            a112
                  on         (a11.configuration_item_key = a112.row_key)
                union select  'd_internal_organization_department'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11   
						 join        ldb.d_internal_contact_mdm    a12
                  on         (a11.user_key = a12.row_current_key)
				join ldb.d_internal_organization_department            a113
                  on         (a12.department_c_key = a113.row_key)
                union select  'd_calendar_fiscal_period'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11   
				join	ldb.d_calendar_greg_fiscal_c	a13
	  on 	(a11.date_key = a13.greogrian_calendar_key)
	join	ldb.d_calendar_date_fiscal	a14
	  on 	(a13.fiscal_key = a14.row_key)				
		join		ldb.d_calendar_fiscal_period     a114
                  on         (a14.period_start_date_key = a114.row_key)
                union select  'd_calendar_month'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11   
				join	ldb.d_calendar_date	a15
	  on 	(a11.date_key = a15.row_key)
				join ldb.d_calendar_month a115
                  on         (a15.month_start_date_key = a115.row_key)
                union select  'd_time_card_category'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11  join        ldb.d_time_card_category          a116
                  on         (a11.category_src_key = a116.row_key)
                union select  'd_time_card_charge_type'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11  join        ldb.d_time_card_charge_type  a117
                  on         (a11.charge_type_key = a117.row_key)
                union select  'd_time_card_state'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11  join   
				ldb.d_time_card_state a118
                  on         (a11.state_src_key = a118.row_key)
                union select  'd_cost_center'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11 
				join	ldb.d_project	a16
	  on 	(a11.project_key = a16.row_key)
				join        ldb.d_cost_center           a119
                  on         (a16.cost_center_c_key = a119.row_key)
                union select  'dh_employee_level1'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11 
				join	ldb.d_internal_contact_mdm	a12
	  on 	(a11.user_key = a12.row_current_key)
				join	ldb.dh_employee_hierarchy	a18
	  on 	(a12.row_dn_key = a18.lev_0_key)
				join        ldb.dh_employee_level1             a120
                  on         (a18.lev_1_key = a120.row_key)
                union select  'd_project_division'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11 
					join	ldb.d_project	a16
	  on 	(a11.project_key = a16.row_key)
				join        ldb.d_project_division  a121
                  on         (a16.division_src_c_key = a121.row_key)
                union select  'd_internal_contact_mdm'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11  
				join	ldb.d_project	a16
	  on 	(a11.project_key = a16.row_key)
				join        ldb.d_internal_contact_mdm    a122
                  on         (a16.manager_c_key = a122.row_key)
                union select  'd_project_priority'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11  
				join	ldb.d_project	a16
	  on 	(a11.project_key = a16.row_key)
				join        ldb.d_project_priority   a123
                  on         (a16.priority_src_c_key = a123.row_key)
                union select  'd_project_stage'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11 
				join	ldb.d_project	a16
	  on 	(a11.project_key = a16.row_key)
				join        ldb.d_project_stage       a124
                  on         (a16.stage_src_c_key = a124.row_key)
                union select  'd_project_state'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11  
				join	ldb.d_project	a16
	  on 	(a11.project_key = a16.row_key)
				join        ldb.d_project_state       a125
                  on         (a16.status_src_c_key = a125.row_key)
                union select  'd_internal_contact_mdm'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11  
				join	ldb.d_project	a16
	  on 	(a11.project_key = a16.row_key)
				join        ldb.d_internal_contact_mdm    a126
                  on         (a16.requestor_c_key = a126.row_key)
                union select  'd_internal_contact_mdm'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11  
				join	ldb.d_project	a16
	  on 	(a11.project_key = a16.row_key)
				join        ldb.d_internal_contact_mdm    a127
                  on         (a16.sponsor_c_key = a127.row_key)
                union select  'dh_employee_level2'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11  
					join	ldb.d_internal_contact_mdm	a12
	  on 	(a11.user_key = a12.row_current_key)
				join	ldb.dh_employee_hierarchy	a18
	  on 	(a12.row_dn_key = a18.lev_0_key)
				join        ldb.dh_employee_level2             a128
                  on         (a18.lev_2_key = a128.row_key)
                union select  'd_calendar_fiscal_year'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11  
				join	ldb.d_calendar_greg_fiscal_c	a13
	  on 	(a11.date_key = a13.greogrian_calendar_key)
	join	ldb.d_calendar_date_fiscal	a14
	  on 	(a13.fiscal_key = a14.row_key)
				join	ldb.d_calendar_fiscal_quarter	a19
	  on 	(a14.quarter_start_date_key = a19.row_key)
				join        ldb.d_calendar_fiscal_year         a129
                  on         (a19.year_start_date_key = a129.row_key)
                union select  'dh_employee_level3'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11 
	join	ldb.d_internal_contact_mdm	a12
	  on 	(a11.user_key = a12.row_current_key)
					join	ldb.dh_employee_hierarchy	a18
	  on 	(a12.row_dn_key = a18.lev_0_key)
	  				join        ldb.dh_employee_level3             a130
                  on         (a18.lev_3_key = a130.row_key)
                union select  'dh_employee_level4'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11  
				join	ldb.d_internal_contact_mdm	a12
	  on 	(a11.user_key = a12.row_current_key)
					join	ldb.dh_employee_hierarchy	a18
	  on 	(a12.row_dn_key = a18.lev_0_key)
				join        ldb.dh_employee_level4             a131
                  on         (a18.lev_4_key = a131.row_key)
                union select  'dh_employee_level5'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11  
				join	ldb.d_internal_contact_mdm	a12
	  on 	(a11.user_key = a12.row_current_key)
					join	ldb.dh_employee_hierarchy	a18
	  on 	(a12.row_dn_key = a18.lev_0_key)
				join        ldb.dh_employee_level5             a132
                  on         (a18.lev_5_key = a132.row_key)