  SELECT CASE WHEN count > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(1) as count from
  -- select a12.number,a12.u_tribe,a14.row_id,a13.row_id,a12.cmdb_ci,a14.row_key,request_item_tribe_c_key from 
  ibmwatson_mdsdb.sn_customerservice_case_final a12
left join ibmwatson_mdsdb.cmdb_ci_final a15 on a12.cmdb_ci=a15.sys_id and a15.sourceinstance=2 and a15.cdctype<>'D'
left join ibmwatson_mdsdb.u_ibm_service_cloud_final a19 on a15.sys_id=a19.sys_id and a19.sourceinstance=2
left join ibmwatson_mdsdb.u_ibm_service_noncloud_final a199 on a15.sys_id=a199.sys_id and a199.sourceinstance=2
left join ibmwatson_mdwdb.d_tribe_c a14 on coalesce(a19.u_tribe,a199.u_tribe)=a14.row_id and a12.sourceinstance=a14.source_id 
JOIN  ibmwatson_mdwdb.d_case a13 ON a13.row_id=a12.sys_id and a12.sourceinstance=a13.source_id
 where coalesce(a14.row_key,case when coalesce(a19.u_tribe,a199.u_tribe) is null then 0 else -1 end)<> a13.case_tribe_c_key )a;
 
 