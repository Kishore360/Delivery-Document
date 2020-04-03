SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident.primary_technical_team_c_key' ELSE 'SUCCESS' END as Message 
FROM
aetna_mdsdb.incident_final src
 join aetna_mdwdb.f_incident trgt
on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id and src.cdctype<>'D'
left join aetna_mdwdb.d_internal_organization lkp
on  CONCAT('GROUP~',assignment_group)=lkp.row_id and src.sourceinstance=lkp.source_id
left join (select source_id,max(lastupdated) as lastupdated from aetna_mdwdb.d_o_data_freshness group by source_id) f1 on
 (f1.source_id = src.sourceinstance) and  (src.cdctime<=f1.lastupdated)
where    coalesce(lkp.row_key,case when u_primary_technical_team is null then 0 else -1 end)  <>trgt.primary_technical_team_c_key;