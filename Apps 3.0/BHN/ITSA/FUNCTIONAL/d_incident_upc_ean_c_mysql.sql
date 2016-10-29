SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.u_upc_ean' ELSE 'SUCCESS' END as Message FROM bhn_mdsdb.incident_final SRC 
left join bhn_mdsdb.u_upc_final u on SRC.u_upc_ean=u.sys_id  and SRC.sourceinstance=u.sourceinstance
LEFT JOIN bhn_mdwdb.d_incident TRGT 
ON (SRC.sys_id =TRGT.row_id  
AND SRC.sourceinstance= TRGT.source_id  )
WHERE COALESCE( u.u_product_description,'')<> COALESCE(TRGT.upc_ean_c,'')	

