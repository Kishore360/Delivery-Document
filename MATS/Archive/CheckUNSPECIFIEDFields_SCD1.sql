

SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'UNSPECIFIED not set for all VARCHAR fields in #TABLE_NAME' ELSE 'SUCCESS' END AS Message 
from #TABLE_NAME
where row_key = -1
and row_id||#COLLIST <>
CAST('UNSPECIFIED'||LEFT('UNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIED
UNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIEDUNSPECIFIED',11*#COLLENGTH)AS varchar(8000))
