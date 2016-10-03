 
SELECT CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.short_description' ELSE 'SUCCESS' END as Message
 FROM (
 select   count(1) as cnt
from 
homedepot_mdsdb.cmdb_ci_database_final SRC 
 LEFT JOIN homedepot_mdwdb.d_configuration_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id)
 WHERE SRC.version<>TRGT.version_c)a
;

 