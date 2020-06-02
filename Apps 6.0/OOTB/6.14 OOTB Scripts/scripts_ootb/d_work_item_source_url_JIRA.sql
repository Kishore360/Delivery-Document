SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'source_url not correct for d_work_item.source_url' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.issue_final SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item TRGT 
ON (concat(SRC.id, '')=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
WHERE concat('<a href="https://ldbsystems.atlassian.net/browse/',COALESCE(SRC.`key`,''),'</a>') <> COALESCE(TRGT.source_url ,'');