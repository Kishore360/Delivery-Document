SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.downgraded_from_p1_flag_c' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM tjxco_mdsdb.incident_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN tjxco_mdwdb.d_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  left JOIN (select *  from tjxco_mdsdb.sys_audit_final  where tablename='incident' and fieldname='priority' 
and oldvalue=1  group by documentkey ) ref on (SRC.sys_id=ref.documentkey and SRC.sourceinstance=ref.sourceinstance)
  WHERE COALESCE(CASE WHEN ref.oldvalue  = 1 then 'Y' else 'N' END,'') <> TRGT.downgraded_from_p1_flag_c ;