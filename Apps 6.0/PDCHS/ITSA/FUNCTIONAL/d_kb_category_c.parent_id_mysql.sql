SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for d_kb_category_c.parent_id' ELSE 'SUCCESS' END as Message 
FROM 
(select count(1) as CNT from 
(select sys_id,sourceinstance,parent_id from pdchs_mdsdb.kb_category_final where CDCTYPE<>'D') src
left JOIN  pdchs_mdwdb.d_kb_category_c trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
where coalesce(src.parent_id, 'UNSPECIFIED') <> trgt.parent_id ) temp;