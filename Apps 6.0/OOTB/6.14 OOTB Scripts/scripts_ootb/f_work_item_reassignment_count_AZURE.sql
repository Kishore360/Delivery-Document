SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.reassignment_count' ELSE 'SUCCESS' END as Message
FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
 ON (concat(SRC.__numerify__primary_key, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
left join (
select tmp.issueid, tmp.sourceinstance, count(tmp.issueid) count_asgn
from #STG_TABLE_SCHEMA.issue_activity_azure_base tmp
 
where lower(tmp.field) = 'assignee' and (tmp.fromstring is not null or tmp.`from` is not null)
group by tmp.issueid, tmp.sourceinstance
) assignment
on SRC.__numerify__primary_key=assignment.issueid
and SRC.sourceinstance=assignment.sourceinstance
WHERE coalesce(assignment.count_asgn, 0) <> coalesce(TRGT.reassignment_count,'');