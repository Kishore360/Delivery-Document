/* Tables Accessed:
d_assignment_group_ccs_c
d_calendar_date
f_change_credit_score_c
 */
 
 select 'ldb."f_change_credit_score_c" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_credit_score_c" a11 
 union
select 'ldb."d_assignment_group_ccs_c" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_credit_score_c" a11 
 join "ldb"."d_assignment_group_ccs_c" a12 
	on (a11.assignment_group_ccs_c_key = a12.row_key)  
 union
select 'ldb."d_calendar_date" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_credit_score_c" a11 
 join "ldb"."d_calendar_date" a13 
	on (a11.date_key_c = a13.row_key) 

