SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT a.sys_id,b.row_id   ,b.  executive_c_key b_executive_c_key  ,a.u_executive a_u_executive,c.row_key,
(case when a.u_executive is null then 'UNSPECIFIED' else (c.row_key) end)
FROM
(SELECT sys_id,sourceinstance, u_executive  
FROM uclahealth_mdsdb.sys_user_group_final )a
 left JOIN  
(SELECT  executive_c_key,source_id,row_id FROM  uclahealth_mdwdb.d_internal_organization
 )b on a.sourceinstance=b.source_id AND  substring(b.row_id,instr(b.row_id,'~')+1,32)=sys_id
 left join uclahealth_mdwdb.d_internal_contact c
on concat('INTERNAL_CONTACT~',a.u_executive)=c.row_id
and a.sourceinstance=c.source_id
)h
where b_executive_c_key<>(case when a_u_executive is null then 'UNSPECIFIED' else (row_key) end))E;


