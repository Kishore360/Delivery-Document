SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.iteration_key' ELSE 'SUCCESS' END as Message
/*select TRGT.row_id, TRGT.row_key, TRGT.work_item_number, sprnt.curr_iteration, 
coalesce(IT.row_key, case when sprnt.curr_iteration is not null then -1 else 0 end) SR, TRGT.iteration_key TG*/

FROM #MDS_TABLE_SCHEMA.issue_final SRC
left join
(
select tmp.issueid,tmp.sourceinstance, tmp.field, (IF(TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(tmp.`from`, ',', -2),',',1))=TRIM(SUBSTRING_INDEX(tmp.`to`, ',', -1)) 
 OR LENGTH(TRIM(SUBSTRING_INDEX(tmp.`to`, ',', -1)))=0,null,TRIM(SUBSTRING_INDEX(tmp.`to`, ',', -1)))) curr_iteration
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
join (
select tmp.issueid,tmp.sourceinstance, tmp.field, max(tmp.primary_sequence_id) curr_iteration_prim_id
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
where upper(tmp.field) = 'ITERATION' and tmp.`to` is not null
group by tmp.issueid,tmp.sourceinstance, tmp.field
) base 
on tmp.issueid=base.issueid and tmp.sourceinstance=base.sourceinstance and tmp.field=base.field and tmp.primary_sequence_id = base.curr_iteration_prim_id
where upper(tmp.field) = 'ITERATION'
) sprnt
ON SRC.id=sprnt.issueid and SRC.sourceinstance=sprnt.sourceinstance

left join #DWH_TABLE_SCHEMA.d_iteration IT
on COALESCE(sprnt.curr_iteration, 'UNSPECIFIED')=IT.row_id and IT.source_id = sprnt.sourceinstance

left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 on concat(SRC.id, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
where coalesce(IT.row_key, case when sprnt.curr_iteration is not null then -1 else 0 end) <> coalesce(TRGT.iteration_key,'');