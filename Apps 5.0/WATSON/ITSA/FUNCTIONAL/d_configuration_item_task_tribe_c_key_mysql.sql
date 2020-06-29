  SELECT CASE WHEN count > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(1) as count from
-- select sys_id,u_tribe,a.u_tribe,d.row_id,tribe_configuration_item_c_key,coalesce(d.row_key,case when u_tribe is null then 0 else -1 end)
   watson_mdsdb.cmdb_ci_final a
left join watson_mdwdb.d_tribe_c d on a.u_tribe=d.row_id and a.sourceinstance=d.source_id and a.cdctype<>'D'
left  JOIN   watson_mdwdb.d_configuration_item a13 ON a13.row_id=a.sys_id and a.sourceinstance=a13.source_id
where tribe_configuration_item_c_key<>coalesce(d.row_key,case when u_tribe is null then 0 else -1 end) )a;