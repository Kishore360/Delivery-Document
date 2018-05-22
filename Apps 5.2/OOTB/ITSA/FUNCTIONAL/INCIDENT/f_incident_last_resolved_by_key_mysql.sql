select 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'f_incident.resolved_by failed' ELSE 'Data Matched' END AS Message
FROM (SELECT count(1) as CNT
FROM (select * from <<tenant>>_mdsdb.incident_final where cdctype<>'D') x 
left outer join <<tenant>>_mdwdb.d_internal_contact y 
ON (y.user_name = x.sys_updated_by  AND x.sourceinstance= y.source_id)
left outer join <<tenant>>_mdwdb.d_internal_contact z on
CONCAT('INTERNAL_CONTACT~',x.resolved_by)=z.row_id  AND x.sourceinstance= z.source_id
JOIN   <<tenant>>_mdwdb.f_incident B on B.ROW_ID=SYS_ID and x.sourceinstance=B.source_id 
join <<tenant>>_mdwdb.d_lov_map map on ( B.state_src_key = map.src_key AND map.dimension_class = 'STATE~INCIDENT')
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = kb.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and last_resolved_by_key<>
case when (coalesce(z.row_key,case when resolved_by is null then 0 end ))=0 
then coalesce(y.row_key,-1) else coalesce(z.row_key,case when resolved_by is null then 0 else -1 end) end
and map.dimension_wh_code ='RESOLVED' and last_resolved_by_key<>-2)temp;  

