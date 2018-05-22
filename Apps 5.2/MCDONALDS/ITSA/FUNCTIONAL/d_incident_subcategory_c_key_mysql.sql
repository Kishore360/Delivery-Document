SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.u_subcategory' ELSE 'SUCCESS' END as Message 
FROM ( SELECT * FROM mcdonalds_mdsdb.incident_final where  cdctype<>'D')  SRC 
JOIN mcdonalds_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN mcdonalds_mdwdb.d_lov LKP 
ON ( concat( 'U_SUBCATEGORY_LOV_C~INCIDENT~~~' ,upper( SRC.u_subcategory)) = LKP.row_id  
AND SRC.sourceinstance = LKP.source_id )  
 left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and COALESCE(LKP.row_key,CASE WHEN SRC.u_subcategory IS NULL THEN 0 else -1 end)<> (TRGT.sub_category_src_key) 
