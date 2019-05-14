SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt from cardinalhealth_mdsdb.rm_defect_final src 
LEFT JOIN cardinalhealth_mdwdb.f_defect_rm_c trgt ON src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
WHERE COALESCE(DATE_FORMAT(CONVERT_TZ(src.opened_at,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED')<>trgt.opened_c_key)ma