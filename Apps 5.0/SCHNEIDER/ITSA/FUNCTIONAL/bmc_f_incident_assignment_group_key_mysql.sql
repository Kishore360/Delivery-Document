

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.assignment_group_key' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt 
  from schneider_mdsdb.hpd_help_desk_final src 
inner join schneider_mdwdb.f_incident trgt on src.entry_id = trgt.row_id and src.sourceinstance = trgt.source_id 
left join schneider_mdwdb.d_internal_organization lkp on COALESCE(CONCAT('GROUP~',src.assigned_group_id),'UNSPECIFIED') = lkp.row_id and src.sourceinstance = lkp.source_id
where coalesce(lkp.row_key,if(src.assigned_group_id is null,0,-1)) <> trgt.assignment_group_key)a;
