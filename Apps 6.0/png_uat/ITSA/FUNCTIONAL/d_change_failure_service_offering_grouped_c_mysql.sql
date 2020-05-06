select case when count(1)>0 then 'Failure' else 'Success' end as Result,
 case when count(1)>0 then 'Data Mismatch' else 'Success' end as Message
 from(
   select change_request.number,coalesce(x.service_offering_grouped,'Not Categorized')  service_offering_grouped,f.service_offering_grouped_c 
FROM png_mdsdb.change_request_final change_request
left join (select  coalesce(chg.service_offering,'UNSPECIFIED') as service_offering,chg.sourceinstance,so.name as service_offering_grouped,count(1) as cnt
 from png_mdsdb.change_request_final as chg
 left join png_mdsdb.service_offering_final as so on chg.service_offering = so.sys_id and chg.sourceinstance = so.sourceinstance
 where chg.state in (-1,0,3)
 group by chg.service_offering,chg.sourceinstance
 order by cnt desc
 limit 30 ) x on coalesce(change_request.service_offering,'UNSPECIFIED') =x.service_offering and change_request.sourceinstance=x.sourceinstance
join png_mdwdb.d_change_request d on change_request.sys_id=d.row_id and change_request.sourceinstance=d.source_id 
join  png_mdwdb.d_change_failure f on d.row_key=f.change_request_key and d.source_id=f.source_id and f.current_flag='Y'
)a
where service_offering_grouped<>service_offering_grouped_c;

