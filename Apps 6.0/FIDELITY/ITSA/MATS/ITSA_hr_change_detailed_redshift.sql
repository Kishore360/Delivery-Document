 select ' f_hr_change ' as Table_name, count(a11.row_key) Row_Count 
from      ldb.f_hr_change   a11
union 
 select ' d_internal_contact ' as Table_name, count(a11.row_key) Row_Count 
from      ldb.f_hr_change   a11
                join        ldb.d_internal_contact  a12
                  on         (a11.employee_key = a12.row_key)
				  union 
				  
				   select ' d_internal_contact_assigned_to ' as Table_name, count(a11.row_key) Row_Count 
from      ldb.f_hr_change   a11
                join        ldb.d_internal_contact_assigned_to       a13
                  on         (a11.assigned_to_key = a13.row_key)
				  union 
				  
				  
				   select ' d_calendar_date ' as Table_name, count(a11.row_key) Row_Count 
from      ldb.f_hr_change   a11
                join        ldb.d_calendar_date      a14
                  on         (a11.date_key = a14.row_key)
				  union 
				    select ' d_calendar_month ' as Table_name, count(a11.row_key) Row_Count 
from      ldb.f_hr_change   a11
                join        ldb.d_calendar_date      a14
                  on         (a11.date_key = a14.row_key)
                join        ldb.d_calendar_month  a15
                  on         (a14.month_start_date_key = a15.row_key)
				  union 
				  
				  	    select ' d_calendar_quarter ' as Table_name, count(a11.row_key) Row_Count 
from      ldb.f_hr_change   a11
                join        ldb.d_calendar_date      a14
                  on         (a11.date_key = a14.row_key)
                join        ldb.d_calendar_month  a15
                  on         (a14.month_start_date_key = a15.row_key)
                join        ldb.d_calendar_quarter a16
                  on         (a15.quarter_start_date_key = a16.row_key)
				  union 
				  select ' d_internal_contact_mdm ' as Table_name, count(a11.row_key) Row_Count 
from      ldb.f_hr_change   a11
                join        ldb.d_internal_contact  a12
                  on         (a11.employee_key = a12.row_key)				  
                join        ldb.d_internal_contact_mdm     a17
                  on         (a12.employee_mdm_key = a17.row_key)
				  
				  union 
				 select ' d_configuration_item ' as Table_name, count(a11.row_key) Row_Count 
from      ldb.f_hr_change   a11 
				  
                join        ldb.d_configuration_item            a18
                  on         (a11.configuration_item_key = a18.row_key)
				  union 
				  select ' d_internal_organization_department ' as Table_name, count(a11.row_key) Row_Count 
from      ldb.f_hr_change   a11
                join        ldb.d_internal_organization_department             a19
                  on         (a11.department_key = a19.row_key)
				  union 
				  
				  
				  select ' d_hr_change_category ' as Table_name, count(a11.row_key) Row_Count 
from      ldb.f_hr_change   a11
                join        ldb.d_hr_change_category          a110
                  on         (a11.category_src_key = a110.row_key)
				  
				  
				  union 
				  
				  select ' d_hr_change_impact ' as Table_name, count(a11.row_key) Row_Count 
from      ldb.f_hr_change   a11
                join        ldb.d_hr_change_impact             a111
                  on         (a11.impact_src_key = a111.row_key)
				  
				  union 
				  
				  select ' d_hr_change ' as Table_name, count(a11.row_key) Row_Count 
from      ldb.f_hr_change   a11
                join        ldb.d_hr_change             a112
                  on         (a11.hr_change_key = a112.row_key)
				  
				  union 
				  select ' d_hr_change_priority ' as Table_name, count(a11.row_key) Row_Count 
from      ldb.f_hr_change   a11
                join        ldb.d_hr_change_priority            a113
                  on         (a11.priority_src_key = a113.row_key)
				  
				  union 
				  
				  select ' d_hr_change_urgency ' as Table_name, count(a11.row_key) Row_Count 
from      ldb.f_hr_change   a11
                join        ldb.d_hr_change_urgency           a114
                  on         (a11.urgency_src_key = a114.row_key)
				  union 
				  
				  select ' d_location ' as Table_name, count(a11.row_key) Row_Count 
from      ldb.f_hr_change   a11
                join        ldb.d_location   a115
                  on         (a11.location_key = a115.row_key)
				  union 
				     select ' d_calendar_week ' as Table_name, count(a11.row_key) Row_Count 
from      ldb.f_hr_change   a11
                join        ldb.d_calendar_date      a14
                  on         (a11.date_key = a14.row_key)
                join        ldb.d_calendar_week    a116
                  on         (a14.week_start_date_key = a116.row_key)
				  union 
				  
				  			  	    select ' d_calendar_quarter ' as Table_name, count(a11.row_key) Row_Count 
from      ldb.f_hr_change   a11
                join        ldb.d_calendar_date      a14
                  on         (a11.date_key = a14.row_key)
                join        ldb.d_calendar_month  a15
                  on         (a14.month_start_date_key = a15.row_key)
                join        ldb.d_calendar_quarter a16
                  on         (a15.quarter_start_date_key = a16.row_key)
                join        ldb.d_calendar_year      a117
                  on         (a16.year_start_date_key = a117.row_key)