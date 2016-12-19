

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message
 FROM 
gogo_mdwdb.d_change_request ds join gogo_mdsdb.change_request_final f on ds.row_id=f.sys_id AND ds.source_id=f.sourceinstance 
where  ds.major_change_date_c<> CONVERT_TZ(f.u_major_change_date,'GMT','America/Chicago)


