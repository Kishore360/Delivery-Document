select case when count(1)>0 then 'Failure' else 'Success' end as Result,
 case when count(1)>0 then 'Data Mismatch' else 'Success' end as Message
 from(
   select number,case when change_request.start_date is null then 'UNSPECIFIED'
when month(change_request.start_date) in (1,2,3) then 'JFM'
when month(change_request.start_date) in (4,5,6) then 'AMJ'
when month(change_request.start_date) in (7,8,9) then 'JAS'
when month(change_request.start_date) in (10,11,12) then 'OND' end as planned_start_quarter_of_year,f.planned_start_quarter_of_year_c 
FROM png_mdsdb.change_request_final change_request
join png_mdwdb.d_change_request d on change_request.sys_id=d.row_id and change_request.sourceinstance=d.source_id
join  png_mdwdb.d_change_failure f on d.row_key=f.change_request_key 
)a
where planned_start_quarter_of_year<>planned_start_quarter_of_year_c;


