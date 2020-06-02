SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed for d_internal_contact.primary_skill_key'
ELSE 'SUCCESS' END AS Message
-- SELECT  SRC.object_id, SRC.skill_id, CONCAT('INTERNAL_CONTACT~', SRC.object_id),  trg.row_id,
-- COALESCE(skill.row_key, '') as qa_val, COALESCE(trg.primary_skill_key, '') as dev_val
from
(
select rsm.object_id, max(rsm.skill_id) skill_id, rsm.sourceinstance
from 

-- Filtering records by joining srm_recorces, as association table has record for team and roles also
(select rsm_asso.* from #MDS_TABLE_SCHEMA.rsm_skills_associations_final rsm_asso
join
(SELECT a.ID, a.srm_sourceinstance FROM 
   (SELECT sourceinstance AS srm_sourceinstance, ID, cdctype, CREATED_DATE FROM #MDS_TABLE_SCHEMA.srm_resources_final WHERE cdctype <> 'D') a
    JOIN (SELECT prid, sourceinstance AS b_sourceinstance FROM #MDS_TABLE_SCHEMA.prj_resources_final WHERE cdctype <> 'D' AND PRISROLE = 0) b 
	ON a.id = b.prid AND a.srm_sourceinstance = b.b_sourceinstance) srm_resource
on rsm_asso.object_id=srm_resource.ID and rsm_asso.sourceinstance=srm_resource.srm_sourceinstance
) rsm

left outer join #MDS_TABLE_SCHEMA.cmn_lookups_final lkp1
on rsm.PROFICIENCY_LEVEL_ID=lkp1.id
left outer join #MDS_TABLE_SCHEMA.cmn_lookups_final lkp2
on rsm.INTEREST_LEVEL_ID=lkp2.id
where 
(rsm.object_id,
((substring(lkp1.LOOKUP_CODE,1,(instr(lkp1.LOOKUP_CODE,'-')-1))*100000)+
(substring(lkp1.LOOKUP_CODE,1,(instr(lkp2.LOOKUP_CODE,'-')-1))*1000) + (WEIGHT*10))) in
(
select rsm.object_id, 
(substring(lkp1.LOOKUP_CODE,1,(instr(lkp1.LOOKUP_CODE,'-')-1))*100000)+
(substring(lkp1.LOOKUP_CODE,1,(instr(lkp2.LOOKUP_CODE,'-')-1))*1000) + (WEIGHT*10)
from #MDS_TABLE_SCHEMA.rsm_skills_associations_final rsm 
left outer join #MDS_TABLE_SCHEMA.cmn_lookups_final lkp1
on rsm.PROFICIENCY_LEVEL_ID=lkp1.id
left outer join #MDS_TABLE_SCHEMA.cmn_lookups_final lkp2
on rsm.INTEREST_LEVEL_ID=lkp2.id 
where (rsm.object_id, 
((substring(lkp1.LOOKUP_CODE,1,(instr(lkp1.LOOKUP_CODE,'-')-1))*100000)+
(substring(lkp1.LOOKUP_CODE,1,(instr(lkp2.LOOKUP_CODE,'-')-1))*1000) + (WEIGHT*10)))
in
(
select rsm.object_id, 
max((substring(lkp1.LOOKUP_CODE,1,(instr(lkp1.LOOKUP_CODE,'-')-1))*100000)+
(substring(lkp1.LOOKUP_CODE,1,(instr(lkp2.LOOKUP_CODE,'-')-1))*1000) + (WEIGHT*10)) AS total_no
from #MDS_TABLE_SCHEMA.rsm_skills_associations_final rsm 
left outer join #MDS_TABLE_SCHEMA.cmn_lookups_final lkp1
on rsm.PROFICIENCY_LEVEL_ID=lkp1.id
left outer join #MDS_TABLE_SCHEMA.cmn_lookups_final lkp2
on rsm.INTEREST_LEVEL_ID=lkp2.id
group by rsm.object_id
)
)
group by rsm.object_id
) SRC
LEFT OUTER JOIN
#DWH_TABLE_SCHEMA.d_resource_skill skill
on skill.row_id = SRC.skill_id
LEFT OUTER JOIN
#DWH_TABLE_SCHEMA.d_internal_contact trg ON (CONCAT('INTERNAL_CONTACT~', SRC.object_id) = trg.row_id
 AND SRC.sourceinstance = trg.source_id)
WHERE
COALESCE(skill.row_key, '') <> COALESCE(trg.primary_skill_key, '');
