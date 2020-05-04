select CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.assignment_group_c_key' ELSE 'SUCCESS' END as Message
 FROM  ingrammicro_mdsdb.incident_final SRC
JOIN  ingrammicro_mdwdb.d_incident TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id and SRC.cdctype<>'D'
left join ingrammicro_mdwdb.d_internal_organization LKP
on (concat('GROUP~',SRC.assignment_group)=LKP.row_id and SRC.sourceinstance= LKP.source_id)
WHERE CASE WHEN SRC.assignment_group is NULL THEN 0 ELSE  COALESCE(LKP.row_key,-1) end <>TRGT.assignment_group_c_key