SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.priority_src_key' ELSE 'SUCCESS' END as Message
 FROM
bhn_mdwdb.d_incident a
inner  join bhn_mdsdb.incident_final b on a.row_id=b.sys_id
	and a.source_id=b.sourceinstance
	where a.email_c <> b.u_email