SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.iteration_count' ELSE 'SUCCESS' END as Message

/*select TRGT.row_id, TRGT.row_key, iteration_count.iteration_count, TRGT.iteration_count, coalesce(iteration_count.iteration_count, 0)  ITR_CN*/

FROM #MDS_TABLE_SCHEMA.issue_final SRC
left join
(
SELECT tmp.issueid, tmp.`field`, tmp.sourceinstance, 
count(distinct IF(TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(tmp.`from`, ',', -2),',',1))=TRIM(SUBSTRING_INDEX(tmp.`to`, ',', -1)) 
 OR LENGTH(TRIM(SUBSTRING_INDEX(tmp.`to`, ',', -1)))=0,null,TRIM(SUBSTRING_INDEX(tmp.`to`, ',', -1)))) as iteration_count
FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
where tmp.`field` = 'ITERATION' and tmp.`to` is not null and tmp.cdctype <> 'D'
group by tmp.issueid, tmp.`field`
) iteration_count
ON concat(SRC.id, '')=iteration_count.issueid and SRC.sourceinstance = iteration_count.sourceinstance

left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 on concat(SRC.id, '')=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 
where coalesce(iteration_count.iteration_count, 0) <> coalesce(TRGT.iteration_count,'');