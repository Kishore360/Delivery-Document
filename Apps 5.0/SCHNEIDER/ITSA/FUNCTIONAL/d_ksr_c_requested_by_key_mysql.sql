SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  
THEN 'MDS to DWH data validation failed for d_ksr_c.requested_by_key' else 'SUCCESS' end as message
FROM schneider_mdsdb.ks_srv_customersurvey_base_final SRC
JOIN schneider_mdwdb.d_ksr_c TRGT ON SRC.customersurveyid  =  TRGT.row_id and  SRC.sourceinstance = TRGT.source_id  
left join schneider_mdsdb.ctm_people_final src_lkp on SRC.contact_id = src_lkp.remedy_login_id and src.sourceinstance = src_lkp.sourceinstance
left join schneider_mdwdb.d_internal_contact lkp on  CONCAT('INTERNAL_CONTACT~',src_lkp.person_id) = lkp.row_id and src_lkp.sourceinstance = lkp.source_id 
where (case when SRC.contact_id is null then 0 when SRC.contact_id is not null and src_lkp.person_id is null then -1 when SRC.contact_id is not null and  src_lkp.person_id is not null then lkp.row_key else -1 end) <> coalesce(TRGT.requested_by_key,-1);