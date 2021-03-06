 SELECT CaSE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (
select count(1) as cnt  from starwood_mdsdb.incident_final a 
left join starwood_mdwdb.d_lov b on 
b.dimension_class like '%HOLD_REASON~INCIDENT%'
and CONCAT('HOLD_REASON~INCIDENT~~~',a.u_hold_reason)=b.src_rowid
left join starwood_mdwdb.f_incident c on b.source_id=c.source_id and b.row_id=c.row_id
where b.row_key<>c.hold_reason_c_key

)i; 