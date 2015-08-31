 
SELECT CaSE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (
select count(1) as cnt  from starwood_mdsdb.incident_final a 
left join starwood_mdwdb.d_location b on a.u_property_restricted_gp=b.row_id and a.sourceinstance=b.source_id
left join starwood_mdwdb.f_incident c on b.source_id=c.source_id and b.row_id=c.row_id
where c.property_restricted_gp_c_key<>b.row_key)d