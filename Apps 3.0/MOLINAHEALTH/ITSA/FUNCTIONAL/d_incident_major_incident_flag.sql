SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM
select count(1) from
(select case when b is null then 'N' else 'Y' end as src,a122.major_incident_flag as trgt from(
select a12.sys_id as a,a13.sys_id as b,a12.sourceinstance sourceinstance from molinahealth_mdsdb.incident_final a12
left join molinahealth_mdsdb.u_major_incident_final a13 on a12.sys_id=a13.sys_id and a12.sourceinstance=a13.sourceinstance)a
left join molinahealth_mdwdb.d_incident a122
on a122.row_id=a.a and a122.source_id=a.sourceinstance)abc
where abc.src<>abc.trgt

