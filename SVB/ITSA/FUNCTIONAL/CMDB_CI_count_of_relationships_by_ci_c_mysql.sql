SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM (
SELECT  a.name,c.label_c,count_of_relationships_by_ci_c as cnt1,COUNT(distinct b.type) as cnt
FROM svb_mdsdb.cmdb_ci_final a
JOIN svb_mdsdb.cmdb_rel_ci_final b
on b.parent=a.sys_id 
and  a.sourceinstance=b.sourceinstance
left join svb_mdsdb.cmdb_rel_type_final  d
on b.type=d.sys_id and  
a.sourceinstance=d.sourceinstance
left join svb_mdwdb.d_configuration_item c 
on a.sys_id=c.row_id and a.sourceinstance=c.source_id 
group by 1,2,3
)a where cnt1<>cnt