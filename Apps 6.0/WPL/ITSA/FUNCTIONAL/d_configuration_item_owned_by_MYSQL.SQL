SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.OWNED_BY' ELSE 'SUCCESS' END as Message  
FROM 
(
select count(1) as cnt from 
wpl_mdsdb.cmdb_ci_final c 
LEFT JOIN wpl_mdsdb.sys_user_final suo ON c.owned_by=suo.sys_id and c.SourceInstance=suo.SourceInstance
join wpl_mdwdb.d_configuration_item trgt
on c.sys_id=trgt.row_id and c.sourceinstance=trgt.source_id 
where CONCAT_WS(' ',suo.first_name, suo.last_name)<>trgt.OWNED_BY and c.cdctype='X'
)ma;



 