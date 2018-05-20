SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_problem.met_sla_flag' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM (select * from <<tenant>>_mdsdb.incident_final where cdctype<>'D') SRC 
  JOIN <<tenant>>_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
 where (SRC.cdctime<=f1.lastupdated) and ( CASE WHEN made_sla = 1 then 'Y' else 'N' END)<> (TRGT.met_sla_flag ))b
