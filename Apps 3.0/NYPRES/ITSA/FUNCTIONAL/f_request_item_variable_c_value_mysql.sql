SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item_variable_c.value' ELSE 'SUCCESS' END as Message
from 
(select (LEFT(TRGT.row_id,locate('~',TRGT.row_id)-1)) as row_id,source_id,left(value,4000) as value from 
nypres_mdwdb.f_request_item_variable_c TRGT) T
join  nypres_mdsdb.sc_item_option_final SRC on SRC.sourceinstance = T.source_id and SRC.sys_id = T.row_id
where T.value <> left(SRC.value,4000)