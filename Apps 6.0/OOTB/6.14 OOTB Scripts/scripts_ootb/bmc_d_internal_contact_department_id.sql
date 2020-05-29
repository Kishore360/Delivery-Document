SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.parent_row_id' ELSE 'SUCCESS' END as Message
FROM (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_ctm_people_final WHERE CDCTYPE<>'D') src
left join #MDS_TABLE_SCHEMA.hlx_ctm_people_organization_final lkp on src.company = lkp.company and src.organization = lkp.organization and src.department = lkp.department and src.sourceinstance = lkp.sourceinstance
left join #MDS_TABLE_SCHEMA.hlx_ctm_people_final manager_lkp on src.managerloginid = manager_lkp.remedy_login_id and src.sourceinstance = manager_lkp.sourceinstance

left join #DWH_TABLE_SCHEMA.d_internal_organization ORG
on concat('DEPARTMENT~',lkp.people_organization_id) = ORG.row_id and ORG.source_id = lkp.sourceinstance

left join #DWH_TABLE_SCHEMA.d_internal_contact TRGT 
on TRGT.row_id = concat('INTERNAL_CONTACT~',src.person_id) and TRGT.source_id = src.sourceinstance

WHERE COALESCE(ORG.row_key,case when src.department is null then 0 else -1 end)<> COALESCE(TRGT.department_key,'') 