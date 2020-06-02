SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'image_url not correct for d_work_item.image_url' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.issue_final SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item TRGT 
ON (concat(SRC.id, '')=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
WHERE concat('<a href="https://ldbsystems.atlassian.net/browse/',COALESCE(SRC.`key`,''),'"> <img src=../images/Numerify/atlassian_jira_url_image.png></a>') <> COALESCE(TRGT.image_url ,'');