/* Tables Accessed:
d_calendar_date
d_calendar_month
d_change_failure
f_change_failure_closed
f_crp_thresholds
f_dq_change_thresholds */

select 'ldb."f_crp_thresholds" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_crp_thresholds" a11 