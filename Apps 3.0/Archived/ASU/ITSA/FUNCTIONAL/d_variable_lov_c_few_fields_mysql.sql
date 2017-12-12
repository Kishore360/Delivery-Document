
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.change_request_key' ELSE 'SUCCESS' END as Message 
 from asu_mdsdb.question_choice_final qc 
inner join asu_mdsdb.question_final b on 
qc.question=b.sys_id 
and qc.sourceinstance=b.sourceinstance
inner join asu_workdb.lsm_ls_variable_list lvl 
on b.name=lvl.variable_name 
and b.sys_id=lvl.row_id
left join asu_mdwdb.d_variable_lov_c d on qc.sys_id=d.row_id and qc.sourceinstance=d.row_id
where qc.value <> d.value or  qc.text <> d.text or qc.question <> d.variable_id


