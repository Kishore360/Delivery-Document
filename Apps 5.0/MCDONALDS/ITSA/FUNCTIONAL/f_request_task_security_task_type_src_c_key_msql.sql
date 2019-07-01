 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_task_fss_c.dormant_flag' ELSE 'SUCCESS' END as Message from (
 select count(1) as cnt 
  from mcdonalds_mdsdb.sc_task_final s
left join mcdonalds_mdwdb.f_request_task f on s.sys_id=f.row_id and s.sourceinstance=f.source_id
LEFT  join mcdonalds_mdwdb.d_lov d on d.row_id= COALESCE(concat('SECURITY_TASK_TYPE_C~SC_TASK~',(case when short_description like '%SMART SSL%' then 'SMART SSL'
					 when short_description like '%Vulnerability Task OS%' then 'OS/APP'
                     when short_description like '%SSL Task - Discovery%' then 'SSL Discovery'
					 when short_description like '%Vulnerability Task DAS%' then 'DAS'
                     when short_description like '%Smart SSL Task%' then 'SMART SSL'
                     when short_description like '%Incident Response%' then 'IRLL'
					 else 'N/A'end )),'SECURITY_TASK_TYPE_C~SC_TASK~N/A')
  
where d.row_key <> f.security_task_type_src_c_key 
and f.soft_deleted_flag ='N')a
;

