SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.company_key' ELSE 'SUCCESS' END as Message
FROM (SELECT * FROM tjxco_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN tjxco_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN tjxco_mdwdb.d_internal_organization LKP 
 ON ( concat('SUBSIDIARY','~',upper(u_company))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_company IS NULL THEN 0 else -1 end) <> (TRGT.company_key);
