SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM meritsa_mdsdb.u_asc_ticket_final  SRC
left join
 meritsa_mdsdb.u_asc_ticket_final SRC1
 on SRC.parent=SRC1.sys_id
JOIN meritsa_mdwdb.f_incident_asc_c TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) 
join
meritsa_mdwdb.d_incident_asc_c LKP
on COALESCE(SRC1.parent,'UNSPECIFIED')= LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.parent is  null then 0 else -1 end )<>(TRGT.grand_parent_asc_incident_c_key) 

