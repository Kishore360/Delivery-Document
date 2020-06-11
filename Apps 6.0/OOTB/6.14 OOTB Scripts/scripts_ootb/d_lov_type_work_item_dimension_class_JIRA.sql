SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_type_work_item.dimension_class' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.issuetype_final where id is not null 
and id <> ''
group by id,sourceinstance) SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  ((CONCAT('TYPE~WORK_ITEM~',(SRC.id)))=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE('TYPE~WORK_ITEM')<>COALESCE(TRGT.dimension_class,'')