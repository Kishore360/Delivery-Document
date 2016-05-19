SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  from homedepot_mdsdb.cmn_location_final a
 left  JOIN homedepot_mdwdb.d_geography b 
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
 where round(a.longitude,7)<> b.longitude)b