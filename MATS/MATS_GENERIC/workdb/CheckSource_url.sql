
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'source_url not correct for <<tablename>>.source_url' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdsdb.#MDS_TABLE_NAME SRC
LEFT JOIN <<tenant>>_workdb.<<tablename>> TRGT 
ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
WHERE concat('<a href="https://#URL/nav_to.do?uri=',replace('#MDS_TABLE_NAME','_final',''),'.do?sys_id=',COALESCE(`sys_id`,''),'" target="_blank">',COALESCE(`number`,''),'</a>')
<> COALESCE(TRGT.source_url ,'')
