SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercury_mdsdb.task_final SRC
JOIN mercury_mdwdb.f_task_c TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
join mercury_mdwdb.d_lov LKP
on CASE 
		WHEN SRC.sys_class_name ='INCIDENT' THEN COALESCE( CONCAT('CONTACT_TYPE','~','TASK','~','~','~',UPPER(SRC.contact_type)),'UNSPECIFIED')
		WHEN SRC.sys_class_name ='U_ASC_TICKET' THEN COALESCE( CONCAT('CONTACT_TYPE','~','U_ASC_TICKET','~','~','~',UPPER(SRC.contact_type)),'UNSPECIFIED')
		ELSE COALESCE( CONCAT('CONTACT_TYPE','~','TASK','~','~','~',UPPER(SRC.contact_type)),'UNSPECIFIED')	END=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.contact_type is null then  0 else -1 end )<> TRGT.contact_type_src_c_key