select'dh_employee_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11  
    join        ldb.d_internal_contact  a12
                  on         (a11.opened_by_key = a12.row_key)
 join        ldb.dh_employee_hierarchy       a15
                  on         (a12.row_current_key = a15.lev_0_key)
				   join        ldb.dh_employee_level1              a117
                  on         (a15.lev_1_key = a117.row_key)
				  UNION
				  select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11  
    				  join        ldb.d_calendar_date      a18
                  on         (a11.opened_on_key = a18.row_key)	  
				    join        ldb.d_calendar_month  a118
                  on         (a18.month_start_date_key = a118.row_key)
				  UNION
				   select'd_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11  
    				  join        ldb.d_calendar_date      a18
                  on         (a11.opened_on_key = a18.row_key)	  
				    join        ldb.d_calendar_month  a118
                  on         (a18.month_start_date_key = a118.row_key)
				                  join        ldb.d_calendar_week    a119
                  on         (a18.week_start_date_key = a119.row_key)
				  UNION
				  select'dh_employee_level2' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11  
    join        ldb.d_internal_contact  a12
                  on         (a11.opened_by_key = a12.row_key)
 join        ldb.dh_employee_hierarchy       a15
                  on         (a12.row_current_key = a15.lev_0_key)
                join        ldb.dh_employee_level2              a120
                  on         (a15.lev_2_key = a120.row_key)
				  UNION
				  select'dh_employee_level3' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11  
    join        ldb.d_internal_contact  a12
                  on         (a11.opened_by_key = a12.row_key)
 join        ldb.dh_employee_hierarchy       a15
                  on         (a12.row_current_key = a15.lev_0_key)
                join        ldb.dh_employee_level3              a121
                  on         (a15.lev_3_key = a121.row_key)
				  UNION
				  		   select'd_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11  
    				  join        ldb.d_calendar_date      a18
                  on         (a11.opened_on_key = a18.row_key)	  
				    join        ldb.d_calendar_month  a118
                  on         (a18.month_start_date_key = a118.row_key)
                join        ldb.d_calendar_quarter a122
                  on         (a18.quarter_start_date_key = a122.row_key)
				  UNION
				   select'dh_employee_level4' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11  
    join        ldb.d_internal_contact  a12
                  on         (a11.opened_by_key = a12.row_key)
 join        ldb.dh_employee_hierarchy       a15
                  on         (a12.row_current_key = a15.lev_0_key)
                join        ldb.dh_employee_level4              a123
                  on         (a15.lev_4_key = a123.row_key)
				  UNION
				  	   select'd_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11  
    				  join        ldb.d_calendar_date      a18
                  on         (a11.opened_on_key = a18.row_key)	  
				    join        ldb.d_calendar_month  a118
                  on         (a18.month_start_date_key = a118.row_key)
                join        ldb.d_calendar_year      a124
                  on         (a18.year_start_date_key = a124.row_key)
				  UNION
				   select'dh_employee_level5' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11  
    join        ldb.d_internal_contact  a12
                  on         (a11.opened_by_key = a12.row_key)
 join        ldb.dh_employee_hierarchy       a15
                  on         (a12.row_current_key = a15.lev_0_key)
                join        ldb.dh_employee_level5              a125
                  on         (a15.lev_5_key = a125.row_key)