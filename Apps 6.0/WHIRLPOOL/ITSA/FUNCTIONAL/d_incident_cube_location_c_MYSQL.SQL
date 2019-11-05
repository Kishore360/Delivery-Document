SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_incident.cube_location_c' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from whirlpool_mdsdb.incident_final  SRC 
 join whirlpool_mdwdb.d_incident TRGT
 on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 where SRC.u_cube_location <>TRGT.cube_location_c and SRC.cdctype='X')ma