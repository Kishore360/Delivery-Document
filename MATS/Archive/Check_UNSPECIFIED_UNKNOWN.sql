





select case when count(1) <> 2 then 'FAILURE' else 'SUCCESS' end as Result,case when count(1) <> 2 then 'UNSPECIFIED, UNKNOWN entries not present in #TABLE_NAME' else 'UNSPECIFIED, UNKNOWN entries present in #TABLE_NAME' end as Message
from (select * from #TABLE_NAME where row_key in (-1,0) and row_id in ('UNSPECIFIED','UNKNOWN') ) A
