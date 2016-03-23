SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message  from
gilead_mdsdb.incident_final SRC
left join  gilead_mdwdb.d_incident TRGT
on SRC.sys_id=TRGT.row_id and 
SRC.sourceinstance =TRGT.source_id 
LEFT JOIN gilead_mdsdb.u_metadata_ci_final LKP
on SRC.u_resolution_code = LKP.sys_id
AND SRC.sourceinstance = LKP.sourceinstance
where LKP.u_value <>TRGT.resolution_code_c