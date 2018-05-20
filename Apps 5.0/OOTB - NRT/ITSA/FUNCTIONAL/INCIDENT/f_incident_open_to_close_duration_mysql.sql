/*If the records fail ,please check if it falls on DST Change date .If this is the case then refer ITSM-2762 or App-1665(parent JIRA)*/


SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.open_to_close_duration' ELSE 'SUCCESS' END as Message 
 from (select count(1) cnt 
 FROM (select * from <<tenant>>_mdsdb.incident_final where cdctype<>'D') SRC
  JOIN <<tenant>>_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 left JOIN <<tenant>>_mdwdb.d_lov_map MAP ON MAP.SRC_KEY=TRGT.STATE_SRC_KEY
 left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and  (TRGT.open_to_close_duration)<>TIMESTAMPDIFF(second,convert_tz(convert_tz( SRC.opened_at,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>),
<<DW_TARGET_TIME_ZONE>>,<<TENANT_SSI_TIME_ZONE>>), 
convert_tz(convert_tz(SRC.closed_at,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>),<<DW_TARGET_TIME_ZONE>>,
<<TENANT_SSI_TIME_ZONE>>))
AND dimension_wh_code = 'CLOSED')b




