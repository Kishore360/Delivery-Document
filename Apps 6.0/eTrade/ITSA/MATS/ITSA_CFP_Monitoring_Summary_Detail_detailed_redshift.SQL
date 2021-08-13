/* Tablles Accessed :
D_CHANGE_REQUEST
d_change_request_state
d_change_success_model_monitor
f_change_success_model_monitor */

Select 'f_change_success_model_monitor',count(1) as Row_Count 
FROM ldb.f_change_success_model_monitor a 
UNION 
Select 'd_change_success_model_monitor',count(1) as Row_Count 
FROM ldb.f_change_success_model_monitor a 
JOIN ldb.d_change_success_model_monitor b ON a.change_success_model_monitor_key=b.row_key 
UNION 
Select 'd_change_success_model_monitor',count(1) as Row_Count 
FROM ldb.f_change_success_model_monitor a 
JOIN ldb.d_change_success_model_monitor b ON a.change_success_model_monitor_key=b.row_key 
JOIN ldb.d_change_request_state c ON b.change_state_src_key=c.row_key 
UNION 
Select 'D_CHANGE_REQUEST',count(1) as Row_Count 
FROM ldb.f_change_success_model_monitor a 
JOIN ldb.d_change_success_model_monitor b ON a.change_success_model_monitor_key=b.row_key 
JOIN ldb.D_CHANGE_REQUEST c ON b.change_state_src_key=c.row_key 

