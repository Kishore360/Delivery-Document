
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'image_url not correct for #DWH_TABLE_NAME.image_url' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.issue_final SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item TRGT 
ON (concat(SRC.id, '')=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
WHERE concat('<a href="https://#URL/',replace('issue_final','_final',''),'.do?sys_id=',COALESCE(`sys_id`,'')
,'" target="_blank" title="Check in ServiceNow"><img src=../images/Numerify/snow_url_image.png></a>')
<> COALESCE(TRGT.image_url ,'')