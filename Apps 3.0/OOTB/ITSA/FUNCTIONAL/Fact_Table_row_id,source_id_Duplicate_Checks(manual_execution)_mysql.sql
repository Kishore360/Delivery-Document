select distinct 
concat('SELECT'' ',cols.table_name,''' as tName,row_id,source_id,count(1) from ',cols.table_schema,'.',cols.table_name,
(CASE cols.column_name WHEN 'CURRENT_FLAG' THEN ' CURRENT_FLAG=''Y''' ELSE '' END),
' where soft_deleted_flag=''N'' Group by 2,3 having count(1)>1;')
from information_schema.columns where cols cols.table_schema like '<<tenant>>_mdwdb%' and cols.table_name 
in ('f_incident','f_change_request','f_problem','f_hr_change','f_keyword','f_outage','f_request','f_request_item'
,'f_response','f_task_sla','f_time_card','f_request_task','f_t_task_activity','f_task_survey','f_outage_task','f_problem_task'); 