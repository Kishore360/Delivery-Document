 -- changed logic as per ITSM-4066
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.major_incident_flag' ELSE 'SUCCESS' END as Message
 -- select TRGT.row_id, dimension_wh_code,dimension_class, COALESCE(  CASE WHEN dimension_wh_code = 'CRITICAL' then 'Y' else 'N' END ,'')
 -- , COALESCE(TRGT.major_incident_flag ,'')
 FROM ( SELECT * FROM ge_mdsdb.incident_final WHERE CDCTYPE<>'D') SRC 
 left join ge_mdwdb.d_lov_map lov_map
 on concat('PRIORITY~INCIDENT~',SRC.priority) = lov_map.src_rowid
 and SRC.sourceinstance = lov_map.source_id
left join ge_mdwdb.d_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id  AND SRC.sourceinstance=TRGT.source_id )
 where COALESCE(  CASE WHEN dimension_wh_code = 'CRITICAL' then 'Y' else 'N' END ,'')
<> COALESCE(TRGT.major_incident_flag ,'');