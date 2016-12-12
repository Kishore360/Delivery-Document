
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.assigned_to_key' ELSE 'SUCCESS' END as Message
FROM nbcu_mdwdb.f_incident a
JOIN nbcu_mdsdb.incident_final s 
ON a.row_id=s.sys_id AND a.source_id = s.sourceinstance
where a.contact_type_src_code_c<>s.contact_type