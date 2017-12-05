
  
  SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select  count(1) cnt from png_mdsdb.cmn_location_final src
  join  png_mdwdb.d_location d on src.sys_id=d.row_id and sourceinstance=source_id
  where after_hrs_support_c<> (case when u_pg_location_service_type003=0 then 'N' else 'Y' end ))a
  
  
  