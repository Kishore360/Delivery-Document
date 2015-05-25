SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(*) as cnt
from  spansion_mdsdb.item_option_new_final i  
left outer join spansion_mdsdb.sc_item_option_final s on i.sys_id = s.item_option_new 
left outer join spansion_mdsdb.sc_item_option_mtom_final m on m.sc_item_option = s.sys_id 
left outer join spansion_mdsdb.sc_req_item_final f on m.request_item = f.sys_id
inner join spansion_workdb.dwh_d_request_item d
on f.sys_id collate utf8_unicode_ci= d.row_id  
where question_text like '%badge%'  and f.short_description in ('GLOBAL MOBILITY - END OF ASSIGNMENT', 
'GLOBAL MOBILITY - PERMANENT TRANSFER','GLOBAL T	ERMINATION - CONVERSION','GLOBAL TERMINATION - EMPLOYEE',
'GLOBAL TERMINATION - EMPLOYEE GROUP', 'GLOBAL TERMINATION - GROUP CONVERSION', 'GLOBAL TERMINATION - NON-EMPLOYEE',
'GLOBAL TERMINATION - NON-EMPLOYEE GROUP','GTP - GROUP CONVERSION' ,'GTP - EMPLOYEE TERMINATION',
'GTP - NON-EMPLOYEE TERMINATION', 'GTP - CONVERSION', 'GTP - EMPLOYEE TERMINATION  due 08-29-2014',
'GTP - NON-EMPLOYEE TERMINATI', 'GTP - NON-EMPLOYEE TERMINATION - DUPLICATE')
and coalesce(d.employee_number,' ') <> coalesce(s.value collate utf8_unicode_ci ,' '))c