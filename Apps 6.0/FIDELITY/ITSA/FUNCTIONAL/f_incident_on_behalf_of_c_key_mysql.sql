SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.on_behalf_of_c_key' ELSE 'SUCCESS' END as Message
FROM
fidelity_mdsdb.incident_final SRC
LEFT JOIN fidelity_mdwdb.d_internal_contact TRGT 
ON (SRC.sourceinstance =TRGT.source_id 
and coalesce(concat('INTERNAL_CONTACT~',SRC.u_on_behalf_of),'UNSPECIFIED' )= TRGT.row_id )
JOIN fidelity_mdwdb.f_incident trgt1
on SRC.sys_id = trgt1.row_id and SRC.sourceinstance = trgt1.source_id
WHERE coalesce(TRGT.row_key,case when SRC.u_on_behalf_of is null then 0 else -1 end) 
<>trgt1.on_behalf_of_c_key

