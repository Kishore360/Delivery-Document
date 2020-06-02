SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'source_url not correct for d_project.project_src_url' ELSE 'SUCCESS' END as Message

from ( SELECT * FROM #MDS_TABLE_SCHEMA.pm_project_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_project TRGT 
ON (SRC.sys_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
WHERE  concat('<a href="https://#URL/',replace('pm_project_final','_final',''),'.do?sys_id=',COALESCE(`sys_id`,'')
,'"target="_blank">',
-- '\\\\\\\u24D8',
`number`
,'</a>')
<> COALESCE(TRGT.project_src_url ,'')