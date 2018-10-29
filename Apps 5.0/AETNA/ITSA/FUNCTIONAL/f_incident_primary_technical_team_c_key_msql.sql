SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident.primary_technical_team_c_key' ELSE 'SUCCESS' END as Message 
FROM
aetna_mdsdb.incident_final src
left join aetna_mdwdb.f_incident trgt
on src.sys_id=trgt.row_id
join aetna_mdwdb.d_internal_organization lkp
on concat('GROUP~',src.u_primary_technical_team)=lkp.row_id and src.sourceinstance=lkp.source_id
where src.cdctype<>'D' and  lkp.row_key<>trgt.primary_technical_team_c_key;