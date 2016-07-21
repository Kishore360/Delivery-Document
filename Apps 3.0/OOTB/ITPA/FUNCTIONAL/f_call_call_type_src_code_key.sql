
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_call.call_type_src_code' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.new_call_final SRC 
 
 left join <<tenant>>_mdwdb.d_lov LKP
on LKP. row_id=CONCAT('CALL_TYPE','~','CALL','~','~','~',upper(SRC.call_type))
 
 
 LEFT JOIN <<tenant>>_mdwdb.f_call TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
 WHERE  coalesce(LKP.row_key, case when SRC.call_type is null then '0' else '-1' end ) <> COALESCE(TRGT.call_type_src_key ,'')