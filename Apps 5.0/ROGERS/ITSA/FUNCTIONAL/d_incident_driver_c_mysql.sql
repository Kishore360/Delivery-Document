SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from (
select count(1) cnt from  rogers_mdwdb.d_incident d
JOIN rogers_mdsdb.incident_final i ON  d.row_id=i.sys_id and d.source_id=i.sourceinstance
LEFT JOIN rogers_mdsdb.us_driver_c_final c 
on i.subcategory=c.subcategory and i.sourceinstance=c.sourceinstance 
where  d.driver_c <> COALESCE(c.driver,i.subcategory,'UNSPECIFIED'))a