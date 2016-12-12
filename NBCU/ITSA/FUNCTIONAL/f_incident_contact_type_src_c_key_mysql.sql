
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.assigned_to_key' ELSE 'SUCCESS' END as Message
FROM nbcu_mdwdb.f_incident a
JOIN nbcu_mdsdb.incident_final s 
ON a.row_id=s.sys_id AND a.source_id = s.sourceinstance
join nbcu_mdwdb.d_lov c
on COALESCE( CONCAT('CONTACT_TYPE_C','~','INCIDENT','~','~','~',upper(s.contact_type)),'UNSPECIFIED') = c.row_id
where coalesce(c.row_key,case when  s.contact_type is null then 0 else -1 end )<>a.contact_type_src_c_key