SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
 FROM rambus_mdsdb.incident_final SRC 
 LEFT JOIN rambus_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  LEFT JOIN  rambus_mdwdb.f_incident TRGTF 
 ON (TRGTF.incident_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
LEFT JOIN rambus_mdwdb.d_lov_map LM ON TRGTF.state_src_key=LM.src_key
LEFT JOIN rambus_mdwdb.d_o_data_freshness FRESH  ON(FRESH.source_id=SRC.sourceinstance) 
 WHERE  
 case when (TRGT.opened_on >= TRGT.closed_on - interval 1 hour
  AND TRGT.multiple_assignment_flag = 'N'
  AND if(DAYNAME(TRGT.opened_on) = 'saturday',0, if(DAYNAME(TRGT.opened_on) = 'sunday'
AND cast(TRGT.opened_on AS time) < '18:00:00',0, if(DAYNAME(TRGT.closed_on) = 'friday'
AND cast(TRGT.closed_on AS time) > '18:00:00',0,1)))) then 'Y' else 'N' end <> TRGT.first_call_resolution_flag;
