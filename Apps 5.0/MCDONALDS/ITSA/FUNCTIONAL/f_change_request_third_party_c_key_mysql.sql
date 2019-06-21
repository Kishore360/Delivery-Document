SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.third_party_c_key' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdwdb.f_change_request trgt
RIGHT JOIN mcdonalds_mdsdb.change_request_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN mcdonalds_mdwdb.d_internal_organization lkp
ON COALESCE(CONCAT('SUBSIDIARY~',src.u_third_party),'UNSPECIFIED') = lkp.row_id and src.sourceinstance = lkp.source_id
WHERE COALESCE(lkp.row_key,CASE WHEN src.u_third_party IS NULL THEN 0 else -1 end) <>third_party_c_key
;
