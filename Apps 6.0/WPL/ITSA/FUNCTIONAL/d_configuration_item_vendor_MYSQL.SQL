
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.vendor' ELSE 'SUCCESS' END as Message  
FROM 
(
select count(1) as cnt from 
wpl_mdsdb.cmdb_ci_final c 
LEFT JOIN wpl_mdsdb.core_company_final ccv ON c.vENDor=ccv.sys_id and c.SourceInstance=ccv.SourceInstance
join wpl_mdwdb.d_configuration_item trgt
on c.sys_id=trgt.row_id and c.sourceinstance=trgt.source_id 
where COALESCE(ccv.name,c.vendor) <>trgt.vendor and c.cdctype='X'
)ma;



 