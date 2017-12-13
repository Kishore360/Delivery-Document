
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt from asu_mdsdb.cmn_location_final a
left join asu_mdwdb.d_location b on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where a.u_building_code<>b.building_code_c

)i; 
