SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.multiple_assignment_flag' ELSE 'SUCCESS' END as Message

FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC 

left join (
select tmp.issueid, tmp.sourceinstance, count(tmp.issueid) count_asgn
from #STG_TABLE_SCHEMA.issue_activity_azure_base tmp 
where lower(tmp.field) = 'assignee' and (tmp.fromstring is not null or tmp.`from` is not null) and (tmp.`from` <> tmp.`to`)
group by tmp.issueid, tmp.sourceinstance
) assignment
on SRC.__numerify__primary_key=assignment.issueid
and SRC.sourceinstance=assignment.sourceinstance

LEFT JOIN  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.__numerify__primary_key, '')=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 
where TRGT.soft_deleted_flag <> 'Y' and coalesce(CASE WHEN coalesce(assignment.count_asgn, 0)>0 THEN 'Y' ELSE 'N' end,'N' ) <>coalesce(TRGT.multiple_assignment_flag,'');