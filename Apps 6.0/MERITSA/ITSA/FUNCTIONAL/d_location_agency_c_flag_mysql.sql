SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select COUNT(1)cnt from
meritsa_mdsdb.cmn_location_final a join
 meritsa_mdwdb.d_location b
on a.sys_id=b.row_id
and a.sourceinstance=b.source_id
where 
case when a.u_agency='1' then 'Y' ELSE 'N' END <> b.agency_c
and a.CDCTYPE='X')b