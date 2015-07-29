





select case when count(1) <> 2 then 'FAILURE' else 'SUCCESS' end as Result,case when count(1) <> 2 then 'UNSPECIFIED, UNKNOWN entries not present in <<tenant>>_workdb.<<tablename>>' else 'UNSPECIFIED, UNKNOWN entries present in <<tenant>>_workdb.<<tablename>>' end as Message
from (select * from <<tenant>>_workdb.<<tablename>> where row_key in (-1,0) and row_id in ('UNSPECIFIED','UNKNOWN') ) A
