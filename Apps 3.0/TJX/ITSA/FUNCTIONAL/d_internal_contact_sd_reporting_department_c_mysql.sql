SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt from tjx_mdsdb.sys_user_final 				as suf 
     
  join tjx_mdsdb.u_reporting_department_final 	as rdf 
    on (suf.u_sd_reporting_department) = rdf.sys_id 
join tjx_mdwdb.d_internal_contact 		as dic on right(dic.row_id,32) = suf.sys_id 
  where  dic.sd_reporting_department_c <> rdf.name)b;
  
  