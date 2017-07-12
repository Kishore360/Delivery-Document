-- f_change_request_closed_by_key.sql
-- rambus has two records with the same user_name ='glin'
SELECT 
 CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.closed_by_key' ELSE 'SUCCESS' END as Message
FROM
(SELECT src.sys_id,trgt.row_id,COALESCE(lkp.row_key,CASE WHEN src.closed_by IS NULL THEN -1 else -1 end) ,closed_by_key,src.closed_by,lv.dimension_wh_code
,COALESCE(src.closed_by,src.sys_updated_by),trgt.pivot_date,lkp.user_name
FROM rambus_mdwdb.f_change_request trgt
RIGHT JOIN rambus_mdsdb.change_request_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN rambus_mdwdb.d_internal_contact lkp
ON IF(src.closed_by is NOT NULL,CONCAT('INTERNAL_CONTACT~',src.closed_by) = lkp.row_id,src.sys_updated_by = lkp.user_name)  and src.sourceinstance = lkp.source_id
-- AND( trgt.pivot_date BETWEEN lkp.effective_from AND lkp.effective_to) AND 
-- AND lkp.user_name ='glin'
JOIN rambus_mdwdb.d_lov_map lv on  
COALESCE(CONCAT('STATE~CHANGE_REQUEST~~~',UPPER(src.STATE)),'UNSPECIFIED') = lv.src_rowid  
 AND lv.dimension_wh_code ='CLOSED' aND lv.dimension_class='STATE~CHANGE_REQUEST'
WHERE (COALESCE(lkp.row_key,CASE WHEN src.closed_by IS NULL THEN -1 else -1 end) <> closed_by_key)
AND lkp.user_name <>'glin'

UNION ALL
SELECT src.sys_id,trgt.row_id,COALESCE(lkp.row_key,CASE WHEN src.closed_by IS NULL THEN -1 else -1 end) ,closed_by_key,src.closed_by,lv.dimension_wh_code
,COALESCE(src.closed_by,src.sys_updated_by),trgt.pivot_date,lkp.user_name
FROM rambus_mdwdb.f_change_request trgt
RIGHT JOIN rambus_mdsdb.change_request_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN rambus_mdwdb.d_internal_contact lkp
ON IF(src.closed_by is NOT NULL,CONCAT('INTERNAL_CONTACT~',src.closed_by) = lkp.row_id,src.sys_updated_by = lkp.user_name)  and src.sourceinstance = lkp.source_id
-- AND( trgt.pivot_date BETWEEN lkp.effective_from AND lkp.effective_to) AND 
-- AND lkp.user_name ='glin'
JOIN rambus_mdwdb.d_lov_map lv on  
COALESCE(CONCAT('STATE~CHANGE_REQUEST~~~',UPPER(src.STATE)),'UNSPECIFIED') = lv.src_rowid  
 AND lv.dimension_wh_code <>'CLOSED' aND lv.dimension_class='STATE~CHANGE_REQUEST'
WHERE (0 <> closed_by_key)
AND lkp.user_name <>'glin'


) temp
;