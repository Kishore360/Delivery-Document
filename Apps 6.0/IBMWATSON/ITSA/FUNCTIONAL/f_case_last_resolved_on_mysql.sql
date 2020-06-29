
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.last_resolved_on' ELSE 'SUCCESS' END as Message
 FROM  ibmwatson_mdwdb.f_case f_c
 LEFT JOIN 
  (select dt.source_id, dt.row_key, dt.row_id, max(fs.created_on) changed_on
from ibmwatson_mdwdb.d_case dt JOIN ibmwatson_mdwdb.d_lov_map dlm 
ON dt.state_src_key = dlm.src_key and dt.source_id = dlm.source_id 
and dlm.dimension_wh_code in ('RESOLVED','CLOSED') and dlm.dimension_class = 'STATE~CASE'
join ibmwatson_mdwdb.f_case_activity fs 
on dt.source_id=fs.source_id and dt.row_key=fs.case_key 
join ibmwatson_mdwdb.d_lov_map d on d.src_key=fs.task_attribute_wh_new_value_key and d.source_id=fs.source_id and 
fs.task_attribute_wh_name='state' and d.dimension_wh_code in ('RESOLVED')
group by dt.source_id, dt.row_key) f
 on  f.row_key=f_c.case_key 
 where  f_c.last_resolved_on<>coalesce(f_c.last_resolved_on,f.changed_on,f_c.closed_on)

