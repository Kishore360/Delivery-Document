SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (SELECT count(1) as cnt
FROM homedepot_mdsdb.incident_final SRC 
 LEFT JOIN homedepot_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN homedepot_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.closed_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
WHERE LKP.full_name<>TRGT.closed_by_c )temp;
