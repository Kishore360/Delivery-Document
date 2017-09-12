SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.resolved_by_key' ELSE 'SUCCESS' END as Message from schneider_mdsdb.hpd_help_desk_final  SRC JOIN schneider_mdwdb.d_incident TRGT ON (SRC.incident_number = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.sourceinstance = TRGT.source_id )
left join (select documentkey,sourceinstance,max(sys_updated_by) as resolved_by
from schneider_workdb.hpd_help_desk_sys_audit where tablename = 'hpd_help_desk' and fieldname = 'Status' and newvalue = 'Resolved'
group by documentkey,sourceinstance ) SRC1 on SRC1.documentkey = TRGT.row_id and TRGT.source_id = SRC1.sourceinstance
left join schneider_mdsdb.ctm_people_final src_lkp on SRC1.resolved_by = src_lkp.remedy_login_id and trgt.source_id = src_lkp.sourceinstance
left join schneider_mdwdb.d_internal_contact lkp on  CONCAT('INTERNAL_CONTACT~',src_lkp.person_id) = lkp.row_id and src_lkp.sourceinstance = lkp.source_id 
where (case when SRC1.resolved_by is null then 0 when SRC1.resolved_by is not null and src_lkp.person_id is null then -1 when SRC1.resolved_by is not null and  src_lkp.person_id is not null then lkp.row_key else -1 end) <> coalesce(TRGT.resolved_by_key,-1);
