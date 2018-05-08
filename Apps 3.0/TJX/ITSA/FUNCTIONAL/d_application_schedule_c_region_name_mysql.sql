SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from  tjx_mdsdb.us_applicationdetails_final SRC 
join tjx_mdwdb.d_application_schedule_c TRGT on
concat(SRC.sys_id,'~',location_id)=left(TRGT.row_id ,65)and SRC.sourceinstance=TRGT.source_id
where SRC.region<>TRGT.region_name)a ;


