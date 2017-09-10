

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.assigned_to_key' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt 
  from schneider_mdsdb.hpd_help_desk_final src
inner join schneider_mdwdb.f_incident trgt on src.incident_number = trgt.row_id and src.sourceinstance = trgt.source_id
left join schneider_mdsdb.ctm_people_final src_lkp on src.assignee_login_id = src_lkp.remedy_login_id and src.sourceinstance = src_lkp.sourceinstance
left join schneider_mdwdb.d_internal_contact lkp on  CONCAT('INTERNAL_CONTACT~',src_lkp.person_id) = lkp.row_id and src_lkp.sourceinstance = lkp.source_id 
where (case when src.assignee_login_id is null then 0 when src.assignee_login_id is not null and src_lkp.person_id is null then -1 when src.assignee_login_id is not null and  src_lkp.person_id is not null then lkp.row_key else -1 end) <> coalesce(trgt.assigned_to_key,-1))a;
