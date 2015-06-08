SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(1) as cnt from gogo_mdsdb.change_request_final a
inner join gogo_mdwdb.d_change_request  b on a.sys_id =b.row_id and a.sourceinstance=b.source_id and b.row_key <100
where a.u_device_asset_name <> b.device_asset_name_c
