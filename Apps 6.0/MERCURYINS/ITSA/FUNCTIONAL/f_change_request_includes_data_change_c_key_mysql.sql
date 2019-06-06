SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercury_mdsdb.change_request_final  SRC 
JOIN mercury_mdwdb.f_change_request TRGT 
ON SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
join mercury_mdwdb.d_lov LKP
on COALESCE(CONCAT('INCLUDES_DATA_CHANGE','~','CHANGE_REQUEST','~','~','~',UPPER(SRC.u_includes_data_change)),'UNSPECIFIED')=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.u_includes_data_change is null then  0 else -1 end )<>TRGT.includes_data_change_c_key
