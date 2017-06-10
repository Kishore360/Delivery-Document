SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message  from
gilead_mdsdb.incident_final SRC
left join  gilead_mdwdb.f_incident TRGT
on SRC.sys_id=TRGT.row_id and 
SRC.sourceinstance =TRGT.source_id 
left join  gilead_mdwdb.d_configuration_item LKP
on LKP.row_id=COALESCE(SRC.u_causing_ci,'UNSPECIFIED')
 AND SRC.sourceinstance  =  LKP.source_id 
where LKP.row_key <>TRGT.causing_ci_c_key