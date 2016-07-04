
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'source_url not correct for #DWH_TABLE_NAME.source_url' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdsdb.#MDS_TABLE_NAME SRC
LEFT JOIN <<tenant>>_mdwdb.#DWH_TABLE_NAME TRGT 
ON (SRC.sys_id  =TRGT.timecard_src_id  
AND SRC.sourceinstance=TRGT.source_id )
WHERE concat('<a href="https://#URL/',replace('#MDS_TABLE_NAME','_final',''),'.do?sys_id=',COALESCE(`sys_id`,'')
,'" target="_blank" title="Check in ServiceNow"><img src=../images/Numerify/snow_url_image.png></a>')
<> COALESCE(TRGT.source_url ,'')
