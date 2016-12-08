
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.assigned_to_key' ELSE 'SUCCESS' END as Message
FROM nbcu_mdwdb.f_incident a
JOIN nbcu_mdsdb.incident_final b ON a.row_id=b.sys_id AND a.source_id = b.sourceinstance
where IF(b.u_information_security = TRUE,'Y','N')<>a.information_security_c_flag