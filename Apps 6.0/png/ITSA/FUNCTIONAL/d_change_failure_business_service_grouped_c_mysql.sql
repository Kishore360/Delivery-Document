select case when count(1)>0 then 'Failure' else 'Success' end as Result,
 case when count(1)>0 then 'Data Mismatch' else 'Success' end as Message
 from (
   select change_request.number,coalesce(x.business_service_grouped,'Not Categorized')  business_service_grouped,f.business_service_grouped_c 
FROM png_mdsdb.change_request_final change_request
left join (select  coalesce(chg.business_service,'UNSPECIFIED') as business_service,chg.sourceinstance,bs.name as business_service_grouped,count(1) as cnt
 from png_mdsdb.change_request_final as chg
 left join png_mdsdb.cmdb_ci_service_final as bs on chg.business_service = bs.sys_id and chg.sourceinstance = bs.sourceinstance
 where chg.state in (-1,0,3)
 group by chg.business_service,chg.sourceinstance
 order by cnt desc
 limit 30 ) x on coalesce(change_request.business_service,'UNSPECIFIED') =x.business_service and change_request.sourceinstance=x.sourceinstance
join png_mdwdb.d_change_request d on change_request.sys_id=d.row_id and change_request.sourceinstance=d.source_id 
join  png_mdwdb.d_change_failure f on d.row_key=f.change_request_key and d.source_id=f.source_id and f.current_flag='Y'
)a
where business_service_grouped<>business_service_grouped_c;


