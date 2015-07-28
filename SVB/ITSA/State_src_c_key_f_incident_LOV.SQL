
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt from uclahealth_mdsdb.incident_final a
 left join uclahealth_mdwdb.d_lov b on 
b.dimension_class like '%STATE~INCIDENT%'
and CONCAT('STATE~INCIDENT~~~',a.incident_state)=b.src_rowid
left join uclahealth_mdwdb.f_incident c on b.source_id=c.source_id and b.row_id=c.row_id
where b.row_key<>c.state_src_key

)i;