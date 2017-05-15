SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from
uclahealth_mdsdb.incident_final x LEFT join uclahealth_mdwdb.d_incident y on
x.u_parent_ticket=y.row_id
left join uclahealth_mdwdb.f_incident B on x.sourceinstance=B.source_id AND B.ROW_ID=x.sys_id
WHERE y.row_key<> B.parent_incident_key
)E;