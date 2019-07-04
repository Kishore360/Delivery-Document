SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.result_of_change_c_flag' ELSE 'SUCCESS' END as Message 
FROM meritsa_mdsdb.change_request_final  SRC 
JOIN meritsa_mdwdb.f_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) 
join meritsa_mdwdb.d_lov LKP
on COALESCE(CONCAT('CATEGORY','~','CHANGE_REQUEST','~',UPPER(SRC.category)),'UNSPECIFIED')= LKP.row_id 
where coalesce(LKP.row_key,case when SRC.category is null then 0 else -1 end) <>TRGT.category_src_key and SRC.CDCTYPE<>'D'