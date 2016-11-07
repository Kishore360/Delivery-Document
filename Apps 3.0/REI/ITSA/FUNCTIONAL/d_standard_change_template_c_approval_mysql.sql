SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(
select count(1) as cnt
from rei_mdsdb.u_standard_change_template_final a
JOIN rei_mdwdb.d_standard_change_template_c b
on a.sourceinstance=b.source_id
and a.sys_id = b.row_id JOIN rei_workdb.lsm_ls_system_variables var ON UPPER(var.type)='ITSM_SYSTEM' AND UPPER(var.property)='SOURCE_URL'
where  a.approval<> b.approval
)a;