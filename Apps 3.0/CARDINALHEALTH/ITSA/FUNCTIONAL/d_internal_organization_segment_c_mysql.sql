SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from cardinalhealth_mdsdb.sys_user_group_final a
 left  JOIN  cardinalhealth_mdwdb.d_internal_organization b
on  a.SYS_ID= b.ROW_ID and a.sourceinstance=b.source_id
where a.u_segment<>b.segment_c)b