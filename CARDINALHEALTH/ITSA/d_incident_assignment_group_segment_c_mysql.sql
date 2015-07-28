
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
 FROM
cardinalhealth_mdwdb.d_incident a
join cardinalhealth_mdsdb.incident_delta d ON a.row_id=d.sys_id AND a.source_id=d.sourceinstance
join cardinalhealth_mdsdb.sys_user_group_final b on b.sys_id=d.assignment_group 
left join cardinalhealth_mdsdb.sys_user_group_final c on b.parent=c.sys_id
where a.assignment_group_segment_c<>coalesce(c.u_segment,b.u_segment);
