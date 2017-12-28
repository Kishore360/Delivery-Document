SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for d_ad_hoc_request_c.description' 
ELSE 'SUCCESS' END as Message 
FROM (SELECT Count(1) as CNT 
FROM aon_mdsdb.u_ad_hoc_request_final  SRC 
JOIN aon_mdwdb.d_ad_hoc_request_c TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
WHERE CHAR_LENGTH(SRC.description)<=4000 and SRC.description <> TRGT.description
)temp;