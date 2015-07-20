

select case when count(1) <> 2 then 'FAILURE' else 'SUCCESS' end as Result,case when count(1) <> 2 then 'UNSPECIFIED, UNKNOWN entries not present in <<tablename>>' else 'UNSPECIFIED, UNKNOWN entries present in <<tablename>>' end as Message
from (select 1 from <<tablename>> where row_key in (-1,0) and row_id in ('UNSPECIFIED','UNKNOWN') ) A
