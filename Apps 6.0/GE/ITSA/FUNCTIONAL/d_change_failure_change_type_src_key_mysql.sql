
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.change_type_src_key' ELSE 'SUCCESS' END as Message
from (SELECT * FROM ge_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM ge_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN ge_mdwdb.d_lov LKP 
 ON ( CONCAT('TYPE','~','CHANGE_REQUEST','~',UPPER(type)) = LKP.src_rowid 
 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.type IS NULL THEN 0 else '-1' end)<> TRGT.change_type_src_key
