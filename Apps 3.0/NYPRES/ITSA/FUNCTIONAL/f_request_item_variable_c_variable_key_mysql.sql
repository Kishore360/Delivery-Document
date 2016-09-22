SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item_variable_c.variable_key' ELSE 'SUCCESS' END as Message
FROM 
(select left(row_id,locate('~',row_id)-1) as row_id, variable_key,source_id
from nypres_mdwdb.f_request_item_variable_c )a
join nypres_mdsdb.sc_item_option_final b on a.row_id =b.sys_id and a.source_id=b.sourceinstance
join nypres_mdwdb.d_variable_c c on b.item_option_new=c.row_id and b.sourceinstance=c.source_id
where  a.variable_key<>c.row_key