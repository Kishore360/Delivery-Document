
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.change_flag' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.sn_customerservice_case_final SRC 
LEFT JOIN <<tenant>>_mdwdb.d_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(case when SRC.caused_by is null then 'N' Else 'Y' end ,'')<> COALESCE(TRGT.change_flag ,'')
