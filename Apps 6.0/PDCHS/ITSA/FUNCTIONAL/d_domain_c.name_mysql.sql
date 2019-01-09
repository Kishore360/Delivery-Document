SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for d_domain_c.name' ELSE 'SUCCESS' END as Message 
FROM 
(select count(1) as CNT from 
(select sys_id,sourceinstance,name from pdchs_mdsdb.domain_final where CDCTYPE<>'D') src
JOIN  pdchs_mdwdb.d_domain_c trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
where coalesce(src.name, 'UNSPECIFIED') <> trgt.name ) temp;