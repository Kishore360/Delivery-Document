SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_application_infra_c.ws_extended_end_of_support_health_date' 
 ELSE 'SUCCESS' END as Message
/*select distinct a11.WebServer_Product,a12.Supplier,a12.Extended_Support,a12.Support_End_Date,
case when a12.Supplier='Microsoft' 
then coalesce(a12.Extended_Support,a12.Support_End_Date) else a12.Support_End_Date end exp_date
,a15.ws_extended_end_of_support_health_date,a16.lastupdated,a15.ws_extended_end_of_support_health*/
from bbandt_mdsdb.v_app_to_server_to_product_final a11
left join bbandt_mdsdb.sa_techportfolio_products_final a12
on (a11.WebServer_Product=a12.Name and a11.sourceinstance=a12.sourceinstance and a12.cdctype<>'D')
join bbandt_mdwdb.f_application_infra_c a15 on 
(concat(a11.app_id,'~',a11.app_name,'~',a11.infra_resource_name,'~',a11.source)=a15.row_id and a11.sourceinstance=a15.source_id)
join (select max(lastupdated) as lastupdated,source_id from bbandt_mdwdb.d_o_data_freshness a group by source_id) a16 
on (a15.source_id=a16.source_id)
where a11.cdctype<>'D' 
and case when a12.Supplier='Microsoft' 
then coalesce(a12.Extended_Support,a12.Support_End_Date) else a12.Support_End_Date end<>a15.ws_extended_end_of_support_health_date;

 
