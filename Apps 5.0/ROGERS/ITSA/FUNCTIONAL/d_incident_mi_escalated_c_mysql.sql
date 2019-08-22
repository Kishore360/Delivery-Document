
SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from (
select count(1) cnt from (
select a.mi_escalated_c , CONVERT_TZ (b.sys_created_on,'GMT','America/New_York') from  rogers_mdwdb.d_incident a
JOIN
(SELECT documentkey,min(sys_created_on) as sys_created_on from rogers_mdsdb.sys_audit_final 
where tablename = 'incident' and fieldname ='priority' and newvalue in (1,2) 
group by 1 
) b ON a.row_id = b.documentkey
where  
a.mi_escalated_c <> CONVERT_TZ (b.sys_created_on,'GMT','America/New_York'))a)b