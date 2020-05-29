SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.multiple_assignment_flag' ELSE 'SUCCESS' END as Message

FROM #MDS_TABLE_SCHEMA.issue_final SRC 

left join (
select tmp.issueid, tmp.sourceinstance, count(tmp.issueid) count_asgn
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
where lower(tmp.field) = 'assignee' and (tmp.fromstring is not null or tmp.`from` is not null) and (tmp.`from` <> tmp.`to`)
group by tmp.issueid, tmp.sourceinstance
) assignment
on SRC.id=assignment.issueid
and SRC.sourceinstance=assignment.sourceinstance

LEFT JOIN  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.id, '')=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 
where coalesce(CASE WHEN assignment.count_asgn>0 THEN 'Y' ELSE 'N' end,'N' ) <>coalesce(TRGT.multiple_assignment_flag,'');