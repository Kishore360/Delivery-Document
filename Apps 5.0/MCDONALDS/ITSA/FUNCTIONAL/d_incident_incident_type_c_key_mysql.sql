SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_request_item.resolution_code_src_c_key' ELSE 'SUCCESS' END as Message from
(select count(1) cnt
FROM mcdonalds_mdsdb.incident_final  src
JOIN  mcdonalds_mdwdb.d_incident trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id and trgt.soft_deleted_flag='N'
LEFT JOIN mcdonalds_mdwdb.d_lov lkp
ON CONCAT('U_INCIDENT_TYPE_C~INCIDENT~~~',src.u_incident_type) = lkp.row_id and src.sourceinstance = lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN src.u_incident_type IS NULL THEN 0 else -1 end)<> trgt.incident_type_c_key
)a;