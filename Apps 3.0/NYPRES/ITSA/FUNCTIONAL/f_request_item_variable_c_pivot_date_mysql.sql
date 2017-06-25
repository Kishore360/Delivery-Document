SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
nypres_mdsdb.sc_item_option_final a
join nypres_mdwdb.f_request_item_variable_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where b.pivot_date<> CONVERT_TZ(a.sys_created_on,'GMT','America/New_York');