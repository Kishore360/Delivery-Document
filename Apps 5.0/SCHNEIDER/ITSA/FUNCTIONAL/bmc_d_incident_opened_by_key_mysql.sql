SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.opened_by_key' ELSE 'SUCCESS' END as Message from schneider_mdsdb.hpd_help_desk_final  SRC JOIN schneider_mdwdb.d_incident TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.sourceid AND SRC.sourceinstance = TRGT.sourceid )
left join schneider_mdsdb.ctm_people_final src_lkp on SRC.submitter = src_lkp.remedy_login_id and SRC.sourceinstance = src_lkp.sourceinstance
left join schneider_mdwdb.d_internal_contact lkp on  CONCAT('INTERNAL_CONTACT~',src_lkp.person_id) = lkp.row_id and src_lkp.sourceinstance = lkp.source_id 
where (case when SRC.submitter is null then 0 when SRC.submitter is not null and src_lkp.person_id is null then -1 when SRC.submitter is not null and  src_lkp.person_id is not null then lkp.row_key else -1 end) <> coalesce(TRGT.opened_by_key,-1);
