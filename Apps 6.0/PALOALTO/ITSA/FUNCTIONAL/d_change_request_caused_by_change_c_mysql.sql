SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_change_request.caused_by_change_c' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM (select * from paloalto_mdsdb.incident_final where cdctype<>'D') SRC 
  JOIN paloalto_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 left join (select source_id,max(lastupdated) as lastupdated from paloalto_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
 where (SRC.cdctime<=f1.lastupdated) and ( CASE WHEN SRC.caused_by is not null then 'Y' else 'N' END)<> (TRGT.caused_by_change_c ))b
