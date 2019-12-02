SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_incident.sd_touched_c_flag' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from wpl_mdsdb.incident_final SRC
left join wpl_mdwdb.d_incident TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where CASE WHEN SRC.u_sd_touched= 1 THEN 'Y' ELSE 'N' END<>TRGT.sd_touched_c_flag
and SRC.cdctype='X')ma
