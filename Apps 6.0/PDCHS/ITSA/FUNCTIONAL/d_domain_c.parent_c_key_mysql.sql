SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for d_domain_c.parent_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(select count(1) as CNT from 
(select sys_id,sourceinstance,parent from pdchs_mdsdb.domain_final where CDCTYPE<>'D') src
left JOIN  pdchs_mdwdb.d_domain_c trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
left join pdchs_mdwdb.d_domain_c lov on src.parent=lov.row_id
where coalesce(lov.row_key, case when src.parent is null then 0 else -1 end) <> trgt.parent_c_key ) temp;