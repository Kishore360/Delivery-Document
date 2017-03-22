
SELECT CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.configuration_item_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
from <<tenant>>_mdwdb.d_lov 
where dimension_class COLLATE utf8_bin <> upper(dimension_class) COLLATE utf8_bin)a;