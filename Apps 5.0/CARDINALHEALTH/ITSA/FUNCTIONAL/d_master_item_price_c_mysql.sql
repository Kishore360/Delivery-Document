SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from cardinalhealth_mdwdb.d_master_item d
JOIN cardinalhealth_mdsdb.sc_cat_item_final i ON d.row_id=i.sys_id AND d.source_id=i.sourceinstance
where i.price<> d.price_c;

