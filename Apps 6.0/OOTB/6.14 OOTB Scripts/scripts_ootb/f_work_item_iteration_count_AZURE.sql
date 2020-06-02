SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.iteration_count' ELSE 'SUCCESS' END as Message

/*select TRGT.row_id, TRGT.row_key, base.sprint_count, coalesce(case when base.sprint_count = 0 then 1 else base.sprint_count end) sr, TRGT.iteration_count*/

FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC
left join
(
SELECT Count(Distinct(tmp.`to`)) AS sprint_count, tmp.issueid AS issueid, tmp.sourceinstance   
from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
where tmp.field = 'ITERATION'
GROUP BY 2, 3
) base
ON SRC.__numerify__primary_key = base.issueid and SRC.sourceinstance = base.sourceinstance

left join #DWH_TABLE_SCHEMA.f_work_item TRGT
 on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id

where TRGT.soft_deleted_flag = 'N' and
coalesce(case when base.sprint_count = 0 then 1 else base.sprint_count end) <> coalesce(TRGT.iteration_count,'');