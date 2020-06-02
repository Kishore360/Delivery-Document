SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.labels_list' ELSE 'SUCCESS' END as Message

from #MDS_TABLE_SCHEMA.issue_final SRC

left join (
select lbl.issueid, lbl.sourceinstance, group_concat(case when lbl.labels is not null then lbl.labels end order by upper(lbl.labels) asc) lbl_list
from #MDS_TABLE_SCHEMA.issue_labels_final lbl
group by lbl.issueid, lbl.sourceinstance
) lblist
on lblist.issueid=SRC.id and SRC.sourceinstance=lblist.sourceinstance

left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 on concat(SRC.id, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where coalesce(lblist.lbl_list,'')<>coalesce(TRGT.labels_list,'')