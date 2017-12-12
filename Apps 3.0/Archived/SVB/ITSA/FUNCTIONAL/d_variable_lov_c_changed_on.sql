 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from 
(select qc.sys_id as row_id, 
qc.sourceinstance  as source_id,
qc.sys_updated_on as changed_on
from
svb_mdsdb.question_choice_final qc 
inner join svb_mdsdb.question_final b on 
qc.question=b.sys_id 
and qc.sourceinstance=b.sourceinstance
inner join svb_workdb.lsm_ls_variable_list lvl 
on b.sys_id=lvl.row_id and b.name=lvl.variable_name 
) src
join 
svb_mdwdb.d_variable_lov_c c
on src.row_id=c.row_id and src.source_id=c.source_id
where  src.changed_on<>c.changed_on
 )c
