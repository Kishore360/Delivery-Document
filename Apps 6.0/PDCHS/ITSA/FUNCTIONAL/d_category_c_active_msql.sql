SELECT CASE WHEN CNT>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0  THEN 'MDS to DWH data validation failed for d_category_c.active' ELSE 'SUCCESS' END as Message  
FROM 
(select count(1) as CNT from 
(select sys_id, sourceinstance, u_active from pdchs_mdsdb.u_category_final where CDCTYPE<>'D') src
left join pdchs_mdwdb.d_category_c trgt 
on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where src.u_active <>  trgt.active) temp;