SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 

FROM (
select count(1) as cnt FROM mcd_mdsdb.incident_task_final SRC 
 
LEFT JOIN mcd_mdwdb.f_incident_task_c TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
JOIN mcd_mdwdb.d_incident_task_c a 
ON SRC.sys_id= a.row_id AND SRC.sourceinstance= a.source_id 

left join mcd_mdwdb.d_lov_map lm 
  ON (lm.src_key = a.state_src_key)
 
LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  mcd_mdwdb.d_o_data_freshness
 group by source_id
 ) df 
 
ON (TRGT.source_id = df.source_id )
 
where lm.dimension_class = 'STATE~INCIDENT_TASKS' 
and 
case when lm.dimension_wh_code in ('OPEN') 
    
then TIMESTAMPDIFF(second, coalesce( SRC.opened_at,0),convert_tz(df.lastupdated, 'America/Los_Angeles','GMT'))
    
else (case when SRC.opened_at> SRC.closed_at then 0 else TIMESTAMPDIFF(second,coalesce( SRC.opened_at,0),coalesce( SRC.closed_at,0)) end)
    
end <>TRGT.age)Temp;