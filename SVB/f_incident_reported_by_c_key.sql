
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT a.sys_id,b.row_id   ,b.  reported_by_c_key b_reported_by_c_key ,a.u_contact a_u_contact,c.row_key,
(case when a.u_contact is null then 'UNSPECIFIED' else coalesce(c.row_key,-1) end)
FROM
(SELECT sys_id,sourceinstance, u_contact  
FROM svb_mdsdb.incident_final )a
left join svb_mdwdb.d_internal_contact_reported_by_c c
on concat('INTERNAL_CONTACT~',a.u_contact)=c.row_id
and a.sourceinstance=c.source_id
 JOIN  
(SELECT  reported_by_c_key,source_id,row_id FROM  svb_mdwdb.f_incident
 )b on a.sourceinstance=b.source_id AND  substring(b.row_id,instr(b.row_id,'~')+1,32)=a.sys_id
 
)h
where b_reported_by_c_key<>coalesce(row_key,-1) )E;