SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_resolution_work_item.soft_deleted_flag' ELSE 'SUCCESS' END as Message
FROM (select max(cdctype) as cdctype,id, sourceinstance from #MDS_TABLE_SCHEMA.resolution_final 
where id is not null and id <> ''
group by id,sourceinstance) SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  ((CONCAT('RESOLUTION~WORK_ITEM~',(SRC.id)))=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
where coalesce(case when SRC.cdctype = 'D' then 'Y' else 'N' end, '')<>coalesce(TRGT.soft_deleted_flag,'')
 