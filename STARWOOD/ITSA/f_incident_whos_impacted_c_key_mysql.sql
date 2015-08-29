
 SELECT CaSE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,
CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM
 (
select count(1) as cnt  from starwood_mdsdb.incident_final a 
left join starwood_mdwdb.d_lov b 
on 
b.dimension_class like '%WHOS_IMPACTED~INCIDENT%'
and CONCAT('WHOS_IMPACTED~INCIDENT~~~',a.u_whos_impacted)=b.src_rowid

left join starwood_mdwdb.f_incident c  on a.sys_id=c.row_id and a.sourceinstance=c.source_id
 where b.row_key<>c.whos_impacted_c_key

)i; 