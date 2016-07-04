select case when count(1) <> 0 then 'SUCCESS' ELSE 'FAILURE' end AS Result,
case when count(1) <> 0 then 'facilities_request_bwd_delta table present in MDSDB' else 'facilities_request_bwd_delta table NOT present in MDSDB' end as Message
from information_schema.columns
where table_name = '#MDS_TABLE_NAME' and table_schema = '<<tenant>>_mdsdb';
