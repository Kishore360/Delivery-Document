SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.standard_change_c_key' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdwdb.f_change_request trgt
RIGHT JOIN mcdonalds_mdsdb.change_request_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN mcdonalds_mdwdb.d_master_item lkp
ON COALESCE(src.u_standard_change,'UNSPECIFIED') = lkp.row_id and src.sourceinstance = lkp.source_id
WHERE COALESCE(lkp.row_key,CASE WHEN src.u_standard_change IS NULL THEN 0 else -1 end) <>standard_change_c_key
;