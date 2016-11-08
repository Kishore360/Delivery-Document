SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from rei_mdwdb.d_task_c a join 
rei_mdsdb.task_final b on a.row_id=b.sys_id and a.source_id=b.sourceinstance
join
rei_workdb.lsm_ls_system_variables var ON UPPER(var.type)='ITSM_SYSTEM' AND UPPER(var.property)='SOURCE_URL'
where CONCAT('<a href=\"',var.column_value,sys_class_name,'.do?sys_id=',sys_id,'\" target=\"_blank\">',number,'</a>')<>a.source_url)c