/* From source table the join to Dimension class _WH does not happen , hence the condition */

SELECT CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.configuration_item_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
from #DWH_TABLE_SCHEMA.d_lov 
where dimension_class not like '%_WH%' and  dimension_class COLLATE utf8_bin <> upper(dimension_class) COLLATE utf8_bin)a;
