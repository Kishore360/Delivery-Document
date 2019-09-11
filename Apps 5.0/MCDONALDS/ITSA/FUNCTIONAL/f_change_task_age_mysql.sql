select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.age' ELSE 'SUCCESS' END as Message
FROM mcdonalds_mdsdb.change_task_final SRC 
 LEFT JOIN mcdonalds_mdwdb.f_change_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
left join mcdonalds_mdwdb.d_lov_map lm 
  ON (lm.src_key = TRGT.state_src_key)
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  mcdonalds_mdwdb.d_o_data_freshness
 group by source_id
 ) df 
 ON (TRGT.source_id = df.source_id )
where lm.dimension_class = 'STATE~TASK'
and case when lm.dimension_wh_code in ('OPEN') 
    then TIMESTAMPDIFF(second, coalesce( SRC.opened_at,0),convert_tz(df.lastupdated, 
	'America/New_York','GMT'))
    else case when SRC.opened_at> SRC.closed_at then 0 else TIMESTAMPDIFF(second,coalesce( SRC.opened_at,0),coalesce( SRC.closed_at,0)) end
    end <>TRGT.age
