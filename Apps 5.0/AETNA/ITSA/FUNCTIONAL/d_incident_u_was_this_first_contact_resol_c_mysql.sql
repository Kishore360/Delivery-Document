SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
aetna_mdwdb.d_incident a 
JOIN aetna_mdsdb.incident_final b
ON a.row_id = b.sys_id and a.source_id = b.sourceinstance 
where
 u_was_this_first_contact_resol_c <> IF( u_was_this_first_contact_resol ,'Y','N')