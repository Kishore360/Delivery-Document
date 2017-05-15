SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from uclahealth_mdsdb.incident_final a
 left join uclahealth_mdwdb.d_lov b on 
b.dimension_class like '%CATEGORY~INCIDENT%'
and CONCAT('CATEGORY~INCIDENT~~~',a.u_category)=b.src_rowid
left join uclahealth_mdwdb.f_incident c on b.source_id=c.source_id and b.row_id=c.row_id
where b.row_key<>c.category_src_key

)i;