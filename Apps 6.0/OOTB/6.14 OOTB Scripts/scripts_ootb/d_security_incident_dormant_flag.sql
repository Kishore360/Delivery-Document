SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_security_incident.dormant_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sn_si_incident WHERE CDCTYPE<>'D') SRC 
  LEFT JOIN #DWH_TABLE_SCHEMA.d_security_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
   JOIN #DWH_TABLE_SCHEMA.d_lov_map dlm ON TRGT.state_src_key = dlm.src_key
    AND dlm.dimension_class = 'STATE~SECURITY_INC'
  AND dlm.dimension_wh_code = 'OPEN'
  LEFT JOIN (
 select source_id,lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 
 ) FRESH  ON(FRESH.source_id=SRC.sourceinstance
 
 )

 WHERE case when (timestampdiff(DAY,TRGT.changed_on, FRESH.lastupdated) >30) and TRGT.dormant_flag = 'N'
   then 'Y' END  <> TRGT.dormant_flag 
