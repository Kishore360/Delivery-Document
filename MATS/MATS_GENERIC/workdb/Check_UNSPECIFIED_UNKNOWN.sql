





select case when count(1) <> 2 then 'FAILURE' else 'SUCCESS' end as Result,case when count(1) <> 2 then 'UNSPECIFIED, UNKNOWN entries not present in <<tenant>>_mdwdb.<<tablename>>' else 'UNSPECIFIED, UNKNOWN entries present in <<tenant>>_mdwdb.<<tablename>>' end as Message
from (select * from <<tenant>>_mdwdb.<<tablename>> where row_key in (-1,0) and row_id in ('UNSPECIFIED','UNKNOWN') ) A
