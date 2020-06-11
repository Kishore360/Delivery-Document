SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.resource_role_key' ELSE 'SUCCESS' END as Message
FROM  (select * from  #MDS_TABLE_SCHEMA.hp_rsc_staff_prof_allocation_final where cdctype<>'D') SRC 
inner join(select * from   #MDS_TABLE_SCHEMA.hp_rsc_staffing_profiles_final where is_active_flag='Y')staf_prof
on SRC.staffing_profile_id=staf_prof.staffing_profile_id
and SRC.sourceinstance=staf_prof.sourceinstance
LEFT JOIN(select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final)SRC1
on SRC.staffing_profile_id=SRC1.prj_staff_prof_id
and SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN(select * from #MDS_TABLE_SCHEMA.hp_rsc_resources_final)SRC2
on SRC.resource_id=SRC2.resource_id
and SRC.sourceinstance=SRC2.sourceinstance
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.f_resource_allocation)TRGT   
on CONCAT('ALLOCATED','~',coalesce(SRC1.prj_project_id,'UNSPECIFIED'),'~',coalesce(SRC.staff_prof_allocation_id,'UNSPECIFIED'))=COALESCE(TRGT.row_id,'') 
and SRC.sourceinstance=TRGT.source_id
LEFT JOIN (select * from #DWH_TABLE_SCHEMA.d_resource_role)LKP
on LKP.row_id  = COALESCE(SRC2.primary_role_id,'') and LKP.source_id  = SRC.sourceinstance
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC2.primary_role_id is null THEN 0 else '-1' end)<> COALESCE(TRGT.resource_role_key,'');     
