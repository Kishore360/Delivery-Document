select CASE WHEN count(1) = 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) = 0 THEN 'requested_for_key do not exist in <<tenant>>_mdwdb.f_request_item' ELSE 'SUCCESS' END as Message
from information_schema.columns
where table_name = '<<tablename>>'
and table_schema = '<<tenant>>_mdwdb'
and column_name = 'requested_for_key'
