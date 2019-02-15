SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for d_work_item_epic.summary' ELSE 'SUCCESS' END as Message 
FROM(select count(1) as CNT from pdchs_mdsdb.epic_final SRC
left JOIN  pdchs_mdwdb.d_work_item_epic TRGT
on SRC.id = TRGT.row_key and SRC.sourceinstance = TRGT.source_id 
where coalesce(SRC.summary,'UNSPECIFIED') <> TRGT.
summary)temp;