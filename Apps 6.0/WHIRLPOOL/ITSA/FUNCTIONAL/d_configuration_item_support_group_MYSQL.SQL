CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from whirlpool_mdsdb.cmdb_ci_delta c 
LEFT JOIN whirlpool_mdsdb.sys_user_group_final sup ON c.support_group=sup.sys_id and c.SourceInstance=sup.SourceInstance
join whirlpool_mdwdb.d_configuration_item TRGT
on c.sys_id=TRGT.row_id and c.sourceinstance=TRGT.source_id 
where sup.name <>TRGT.SUPPORT_GROUP, 