SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.closed_on' ELSE 'SUCCESS' END as Message from (select count(1) cnt   FROM (select * from <<tenant>>_mdsdb.incident_final where cdctype<>'D') SRC  
JOIN <<tenant>>_mdwdb.d_incident TRGT  ON 
(SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
join  <<tenant>>_mdwdb.f_incident TRGTF  ON TRGTF.incident_key=TRGT.row_key
JOIN <<tenant>>_mdwdb.d_lov_map lkp
on TRGTF.state_src_key = lkp.src_key
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and convert_tz(coalesce(SRC.closed_at,sys_updated_on),<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>)<> (TRGT.closed_on)
AND dimension_wh_code = 'CLOSED')b
