SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_item.u_requested_for' ELSE 'SUCCESS' END as Message 
FROM svb_mdwdb.f_incident TGT
join svb_mdsdb.incident_final SRC
on TGT.row_id = SRC.sys_id and TGT.source_id= SRC.sourceinstance
left join svb_mdwdb.d_lov lkp
ON ( CONCAT('ENVIRONMENT~INCIDENT','~~~',UPPER(SRC.u_environment))= lkp.src_rowid 
and SRC.sourceinstance = lkp.source_id)
where TGT.inc_environment_c_src_key <> COALESCE(lkp.row_key,CASE WHEN SRC.u_environment IS NULL THEN 0 else -1 end);