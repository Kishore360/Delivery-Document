

 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(1) as cnt from usf_mdwdb.d_incident a join
usf_mdsdb.incident_final b on a.row_id =b.sys_id and
a.source_id=b.sourceinstance
where a.business_service_c <> coalesce(b.u_csi_service,'UNSPECIFIED'))c;
 