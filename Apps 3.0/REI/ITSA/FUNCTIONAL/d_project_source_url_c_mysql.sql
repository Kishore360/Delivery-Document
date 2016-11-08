SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(
select count(1) as cnt
from rei_mdsdb.pm_project_final a
JOIN rei_mdwdb.d_project b
on a.sourceinstance=b.source_id
and a.sys_id = b.row_id JOIN rei_workdb.lsm_ls_system_variables var ON UPPER(var.type)='ITSM_SYSTEM' AND UPPER(var.property)='SOURCE_URL'
where CONCAT('<a href=\"',var.column_value,'project.do?sys_id=',a.sys_id,'\" target=\"_blank\">',a.number,'</a>')<>b.project_src_url
)a;