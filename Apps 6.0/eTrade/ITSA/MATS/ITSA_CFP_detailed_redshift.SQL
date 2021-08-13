/* Tables Accessed:
D_CHANGE_REQUEST
d_change_calendar_month
d_change_configuration_item
d_change_configuration_item_mdm
d_change_date
d_change_failure
d_change_failure_probability
d_change_internal_contact_assigned_to
d_change_request_assignment_group
d_change_request_close_code
d_change_request_state
f_change_failure */


select 'ldb.f_change_failure a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
UNION 
select 'ldb.d_change_failure a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
JOIN ldb.d_change_failure b ON a11.change_failure_key=b.row_key 
UNION 
select 'ldb.D_CHANGE_REQUEST a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
JOIN ldb.D_CHANGE_REQUEST b ON a11.CHANGE_REQUEST_KEY=b.row_key 
UNION 
select 'ldb.d_change_request_state a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
JOIN ldb.D_CHANGE_REQUEST b ON a11.CHANGE_REQUEST_KEY=b.row_key 
JOIN ldb.d_change_request_state c ON b.STATE_SRC_KEY=c.row_key 
UNION 
select 'ldb.d_change_request_close_code a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
JOIN ldb.D_CHANGE_REQUEST b ON a11.CHANGE_REQUEST_KEY=b.row_key 
JOIN ldb.d_change_request_close_code c ON b.CLOSE_CODE_SRC_KEY=c.row_key 
UNION 
select 'ldb.d_change_request_assignment_group a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
JOIN ldb.D_CHANGE_REQUEST b ON a11.CHANGE_REQUEST_KEY=b.row_key 
JOIN ldb.d_change_request_assignment_group c ON b.ASSIGNMENT_GROUP_KEY=c.row_key 
UNION 
select 'ldb.d_change_internal_contact_assigned_to a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
JOIN ldb.D_CHANGE_REQUEST b ON a11.CHANGE_REQUEST_KEY=b.row_key 
JOIN ldb.d_change_internal_contact_assigned_to c ON b.ASSIGNED_TO_KEY=c.row_key
UNION 
select 'ldb.d_change_failure_probability a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
JOIN ldb.D_CHANGE_REQUEST b ON a11.CHANGE_REQUEST_KEY=b.row_key 
JOIN ldb.d_change_failure_probability c ON b.CHANGE_REQUEST_KEY_FP=c.row_key
UNION 
select 'ldb.d_change_date a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
JOIN ldb.d_change_date b ON a11.change_date_key=b.row_key 
UNION 
select 'ldb.d_change_configuration_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
JOIN ldb.D_CHANGE_REQUEST b ON a11.CHANGE_REQUEST_KEY=b.row_key 
JOIN ldb.d_change_configuration_item c ON b.CONFIGURATION_ITEM_KEY=c.row_key
UNION 
select 'ldb.d_change_configuration_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
JOIN ldb.D_CHANGE_REQUEST b ON a11.CHANGE_REQUEST_KEY=b.row_key 
JOIN ldb.d_change_configuration_item c ON b.CONFIGURATION_ITEM_KEY=c.row_key
JOIN ldb.d_change_configuration_item_mdm d ON c.mdm_key=d.row_key 
UNION 
select 'ldb.d_change_date a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
JOIN ldb.d_change_date b ON a11.change_date_key=b.row_key 
JOIN ldb.d_change_calendar_month c ON b.month_start_date_key=c.row_key



