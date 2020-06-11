SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH validation failed for d_test_execution.image_url' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.azure_test_run_final  where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.d_test_execution TRGT
on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where TRGT.row_key not in (0, -1) and 
coalesce(CONCAT('<a href=\"',SRC.webAccessUrl,'"><img src=..\/images\/Numerify\/azure_devops_url_image.png></a>'), '') <> coalesce(TRGT.image_url,'');