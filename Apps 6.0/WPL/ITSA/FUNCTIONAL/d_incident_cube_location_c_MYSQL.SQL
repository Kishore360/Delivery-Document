SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_incident.cube_location_c' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from wpl_mdsdb.incident_final  SRC 
 join wpl_mdwdb.d_incident TRGT
 on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id and SRC.cdctype='X'
 where SRC.u_cube_location <>TRGT.cube_location_c )ma