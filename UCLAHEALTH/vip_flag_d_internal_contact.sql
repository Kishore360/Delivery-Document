SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from uclahealth_mdsdb.sys_user 
 JOIN  
 uclahealth_mdwdb.d_internal_contact B on sourceinstance=B.source_id AND B.ROW_ID=SYS_ID
WHERE vip<> B.vip_flag)e;