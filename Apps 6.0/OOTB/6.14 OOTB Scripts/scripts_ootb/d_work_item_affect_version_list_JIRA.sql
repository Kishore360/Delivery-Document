SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.affect_version_list' ELSE 'SUCCESS' END as Message
 from 
(
select SRC.id,SRC.sourceinstance,group_concat(PV.name) as affect_version_list
from #MDS_TABLE_SCHEMA.issue_final SRC

left join #MDS_TABLE_SCHEMA.issue_affectedversions_final IC
on IC.issues_id=SRC.id
and SRC.sourceinstance=IC.sourceinstance

left join #MDS_TABLE_SCHEMA.project_versions_final PV
on IC.affectedVersions_id=PV.id
and PV.sourceinstance=IC.sourceinstance

group by SRC.id,SRC.sourceinstance
)SRC

left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 on concat(SRC.id, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where coalesce(SRC.affect_version_list,'')<>coalesce(TRGT.affect_version_list,'')