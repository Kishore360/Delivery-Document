SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) cnt from pan_mdsdb.sys_user_group_final
left join pan_mdwdb.d_lov d on COALESCE(CONCAT('PORTFOLIO~SYS_USER_GROUP~~~',u_portfolio),'UNSPECIFIED')=d.row_id
left join pan_mdwdb.d_internal_organization d1 on concat('GROUP~',sys_id)=d1.row_id and sourceinstance=d1.source_id
where coalesce(d.row_key,case when u_portfolio is null then 0 else -1 end)<>portfolio_src_c_key)a;


