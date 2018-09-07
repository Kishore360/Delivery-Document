SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident.incident_domain_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(select * from pdchs_mdsdb.incident_final  where CDCTYPE<>'D') src  
left join pdchs_mdwdb.f_incident f on src.sys_id=f.row_id and src.sourceinstance=f.source_id 
  
join pdchs_mdwdb.d_domain_c domain on src.sys_domain=domain.sys_domain 
where coalesce(domain.row_key, case when src.sys_domain is null then 0 else -1 end)= f.incident_domain_c_key; 