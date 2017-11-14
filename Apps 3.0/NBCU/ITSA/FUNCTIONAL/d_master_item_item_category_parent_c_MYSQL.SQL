
 


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_master_item_item_category_parent_c' ELSE 'SUCCESS' END as Message
FROM 
(  
SELECT Count(1) as CNT 
FROM nbcu_mdsdb.sc_req_item_final a 
JOIN nbcu_mdsdb.sc_cat_item_final b ON (a.cat_item=b.sys_id AND a.sourceinstance=b.sourceinstance)
JOIN nbcu_mdsdb.sc_category_final c ON (b.category=c.sys_id AND b.sourceinstance=c.sourceinstance)
JOIN nbcu_mdsdb.sc_category_final d ON (c.parent=d.sys_id AND c.sourceinstance=d.sourceinstance)
JOIN nbcu_mdwdb.d_master_item trgt ON (b.sys_id=trgt.row_id and b.sourceInstance=trgt.source_id)
WHERE COALESCE(d.title,'UNSPECIFIED')<>trgt.item_category_parent_c
)a;
