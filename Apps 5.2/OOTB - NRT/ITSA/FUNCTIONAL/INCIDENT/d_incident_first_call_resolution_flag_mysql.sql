 SELECT 
 CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
   FROM (select * from <<tenant>>_mdsdb.incident_final where cdctype<>'D') SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id  AND SRC.sourceinstance=TRGT.source_id )
  LEFT JOIN  <<tenant>>_mdwdb.f_incident TRGTF 
 ON (TRGTF.incident_key =TRGT.row_key  AND TRGTF.source_id =TRGT.source_id)
 LEFT JOIN <<tenant>>_mdwdb.d_lov_map LM ON TRGTF.state_src_key=LM.src_key and LM.dimension_class='STATE~INCIDENT'
LEFT JOIN ( select source_id,max(lastupdated) as lastupdated from  <<tenant>>_mdwdb.d_o_data_freshness group by source_id ) df 
ON TRGTF.source_id = df.source_id
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
 where (SRC.cdctime<=f1.lastupdated) and    (CASE WHEN LM.dimension_wh_code IN('RESOLVED','CLOSED') and TIMESTAMPDIFF(MINUTE,TRGT.opened_on,coalesce(TRGT.last_resolved_on,TRGT.closed_on))<30 
 THEN 'Y'  when LM.dimension_wh_code IN('OPEN')  and TIMESTAMPDIFF(MINUTE, TRGT.opened_on, df.lastupdated) < 30 then 'P' Else  'N' END) 
 <> (TRGT.first_call_resolution_flag ))a;
 
 




