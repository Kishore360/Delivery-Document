select CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.change_parent_incident_c_key' ELSE 'SUCCESS' END as Message
 FROM  ingrammicro_mdsdb.change_request_final SRC
JOIN  ingrammicro_mdwdb.f_change_request TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id and SRC.cdctype<>'D'
left join ingrammicro_mdwdb.d_incident LKP
on (SRC.parent)=LKP.row_id and SRC.sourceinstance= LKP.source_id
WHERE CASE WHEN SRC.parent is NULL THEN 0 ELSE  COALESCE(LKP.row_key,-1) end <>TRGT.change_parent_incident_c_key;