select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message 
FROM (

select count(1) as cnt 

from wpl_mdsdb.cmdb_ci_final c 
LEFT JOIN wpl_mdsdb.sys_user_group_final sup ON c.support_group=sup.sys_id and c.SourceInstance=sup.SourceInstance
join wpl_mdwdb.d_configuration_item TRGT
on c.sys_id=TRGT.row_id and c.sourceinstance=TRGT.source_id 
where coalesce(sup.name,'Unspecified') <>TRGT.SUPPORT_GROUP and c.cdctype<>'D')a 