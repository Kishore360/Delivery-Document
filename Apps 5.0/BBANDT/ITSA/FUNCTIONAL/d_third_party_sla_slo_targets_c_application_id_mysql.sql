SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_third_party_sla_slo_targets_c.application_id' ELSE 'SUCCESS' END as Message
 FROM bbandt_mdsdb.us_Third_Party_SLA_SLO_Targets_final src 
 join bbandt_mdwdb.d_third_party_sla_slo_targets_c trgt
  ON trgt.row_id = src.Application_Name and trgt.source_id = src.sourceinstance
 WHERE COALESCE(src.APP_ID,'UNSPECIFIED') <> trgt.application_id
 and src.cdctype='X';