select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'Row_count failed for f_resource_allocation_allocated' else 'SUCCESS' end as Message
from (select * from
(select count(*) count_1 from #DWH_TABLE_SCHEMA.f_resource_allocation where row_key not in (0,-1) 
and row_id like '%ALLOCATED%' and soft_deleted_flag='N')TRGT,
(select count(*) count_2 
 FROM (
 (select *  from #MDS_TABLE_SCHEMA.hp_rsc_staff_prof_allocation_final where cdctype<>'D') SRC1 
 inner join(select * from   #MDS_TABLE_SCHEMA.hp_rsc_staffing_profiles_final where is_active_flag='Y')staf_prof
on SRC1.staffing_profile_id=staf_prof.staffing_profile_id
and SRC1.sourceinstance=staf_prof.sourceinstance
 left join (select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final) SRC2
 on SRC1.staffing_profile_id=SRC2.prj_staff_prof_id
 and SRC1.sourceinstance=SRC2.sourceinstance
 )) SRC
where count_1 <> count_2)SQ