select case when count(1)>0 then 'Failure' else 'Success' end as Result,
 case when count(1)>0 then 'Data Mismatch' else 'Success' end as Message
 from(
   select number,coalesce(TIMESTAMPDIFF(DAY,change_request.u_pg_planned_testing_start,change_request.u_pg_planned_testing_end), -1)
planned_testing_duration,f.planned_testing_duration_c planned_testing_duration_c
FROM png_mdsdb.change_request_final change_request
join png_mdwdb.d_change_request d on sys_id=row_id and sourceinstance=source_id
join  png_mdwdb.d_change_failure f on d.row_key=f.change_request_key )a
where planned_testing_duration<>planned_testing_duration_c;


