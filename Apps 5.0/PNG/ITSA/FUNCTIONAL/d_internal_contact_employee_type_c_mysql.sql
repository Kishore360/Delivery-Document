
  
  SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select  count(1) cnt from png_mdsdb.sys_user_final src
  join  png_mdwdb.d_internal_contact d on src.sys_id=d.row_id and sourceinstance=source_id
  where employee_type_c<> (u_employee_type))a
  
  
  
  
  