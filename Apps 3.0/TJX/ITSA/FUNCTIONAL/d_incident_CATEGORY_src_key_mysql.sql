SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
FROM 
(SELECT count(1) as CNT
FROM tjx_mdsdb.incident_final SRC
LEFT  join tjx_mdsdb.u_inc_cat_options_final b on SRC.category=b.sys_id
LEFT JOIN tjx_mdwdb.d_lov LKP 
ON LKP.dimension_class like '%CATEGORY~INCIDENT%' and 
(concat('CATEGORY~INCIDENT~~~',b.U_CATEGORY)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) 
LEFT JOIN tjx_mdwdb.d_incident TRGT 
ON (SRC.sys_id =TRGT.row_id  
AND SRC.sourceinstance= TRGT.source_id  )
WHERE COALESCE(LKP.row_key,CASE WHEN b.U_CATEGORY IS NULL THEN 0 else -1 end)<> (TRGT.CATEGORY_src_key))temp;