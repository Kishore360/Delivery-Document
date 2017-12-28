SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message FROM (
select count(1) as cnt from  svb_mdsdb.question_choice_final qc
join svb_mdwdb.d_variable_lov_c trgt on sys_id=row_id and sourceinstance=source_id
where qc.value <> trgt.value or  qc.text <> trgt.text or  qc.question <> variable_id)a