 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM pan6_mdsdb.u_stask_final SRC 
 LEFT JOIN pan6_mdwdb.d_sr_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
left  JOIN pan6_mdwdb.d_lov_map lkp
on lkp.src_key=t.state_src_key and lkp.dimension_wh_code in ('CLOSED','RESOLVED')
WHERE coalesce(t.last_resolved_on,'') <> coalesce(convert_tz(coalesce(s.u_resolved_at),'GMT','America/Los_Angeles'),''))t ;

