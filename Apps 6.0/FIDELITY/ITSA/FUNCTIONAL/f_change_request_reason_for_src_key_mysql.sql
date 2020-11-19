SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.reason_src_c_key' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.change_request_final src
JOIN fidelity_mdwdb.f_change_request trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN fidelity_mdwdb.d_lov lkp
ON COALESCE(CONCAT('REASON~CHANGE_REQUEST~',src.reason),'UNSPECIFIED') =lkp.row_id and lkp.source_id=src.sourceinstance and lkp.dimension_class='REASON~CHANGE_REQUEST'
where COALESCE(lkp.row_key,CASE WHEN src.reason IS NULL THEN 0 else -1 end)<> trgt.reason_src_key and src.cdctype<>'D'
;



