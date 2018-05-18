
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.business_duration_c' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM mcdonalds_mdsdb.incident_final where  cdctype<>'D') SRC  LEFT JOIN mcdonalds_mdwdb.f_incident TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
  left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
 where (SRC.cdctime<=f1.lastupdated) and COALESCE( TIMESTAMPDIFF(second,'1970-01-01 00:00:00',SRC.business_duration),'')<> COALESCE(TRGT.business_duration_c ,0) 
 