SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
  FROM tjx_mdsdb.incident_final SRC
LEFT  join tjx_mdsdb.u_inc_subcat_options_final b on SRC.subcategory=b.sys_id
LEFT JOIN tjx_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%SUBCATEGORY~INCIDENT%' and 
( concat('SUBCATEGORY~INCIDENT~~~',b.u_subcategory)= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id ) 
 LEFT JOIN tjx_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN b.u_subcategory IS NULL THEN 0 else -1 end)<> (TRGT.sub_category_src_key))temp;