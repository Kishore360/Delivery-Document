select case when count(1)>0 then 'Failure' else 'Success' end as Result,
 case when count(1)>0 then 'Data Mismatch' else 'Success' end as Message
 from(
   select number,cmn_location.u_pg_region region,f.region_c 
FROM png_mdsdb.change_request_final change_request
join png_mdsdb.cmn_location_final cmn_location on change_request.location=cmn_location.sys_id and change_request.sourceinstance=cmn_location.sourceinstance
join png_mdwdb.d_change_request d on change_request.sys_id=d.row_id and change_request.sourceinstance=d.source_id
join  png_mdwdb.d_change_failure f on d.row_key=f.change_request_key 
)a
where region<>region_c;

