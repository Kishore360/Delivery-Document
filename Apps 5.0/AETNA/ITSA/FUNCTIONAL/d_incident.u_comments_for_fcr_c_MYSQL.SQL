SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_incident.u_comments_for_fcr_c' ELSE 'SUCCESS' END as Message 
FROM 
(select count(1) as cnt  from aetna_mdsdb.incident_final  src
 left join aetna_mdwdb.d_incident trgt on src.sys_id=trgt.row_id and src.sourceinstance = trgt.source_id
where COALESCE(src.u_comments_for_fcr,'UNSPECIFIED') <> trgt.u_comments_for_fcr_c and src.cdctype<>'D')ma;