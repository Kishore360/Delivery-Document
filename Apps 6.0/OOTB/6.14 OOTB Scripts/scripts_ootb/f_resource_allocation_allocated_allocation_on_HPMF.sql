SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.allocation_on' ELSE 'SUCCESS' END as Message
FROM  (select * from  #MDS_TABLE_SCHEMA.hp_rsc_staff_prof_allocation_final where cdctype<>'D') SRC 
inner join(select * from   #MDS_TABLE_SCHEMA.hp_rsc_staffing_profiles_final where is_active_flag='Y')staf_prof
on SRC.staffing_profile_id=staf_prof.staffing_profile_id
and SRC.sourceinstance=staf_prof.sourceinstance
LEFT JOIN(select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final)SRC1
on SRC.staffing_profile_id=SRC1.prj_staff_prof_id
and SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.f_resource_allocation)TRGT   
on CONCAT('ALLOCATED','~',coalesce(SRC1.prj_project_id,'UNSPECIFIED'),'~',coalesce(SRC.staff_prof_allocation_id,'UNSPECIFIED'))=COALESCE(TRGT.row_id,'') 
and SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(convert_tz(SRC.allocation_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<> COALESCE(TRGT.allocation_on,'')




    
