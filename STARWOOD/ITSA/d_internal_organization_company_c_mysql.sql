 SELECT CaSE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,
CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 

FROM (
select COUNT(1) as cnt from starwood_mdsdb.sys_user_group_final a 
left join 

starwood_mdwdb.d_internal_organization b on 
CONCAT('GROUP~',a.sys_id)=b.row_id and a.sourceinstance=b.source_id
where a.u_company<>b.company_c)c