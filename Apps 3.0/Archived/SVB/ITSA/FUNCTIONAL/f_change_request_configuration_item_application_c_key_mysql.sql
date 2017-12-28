
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (

select count(1) as cnt from(

select c.configuration_item_application_c_key,b.row_key,u_application 
fROM svb_mdsdb.change_request_final a
 
left JOIN  

svb_mdwdb.d_configuration_item b on
a.sourceinstance=b.source_id AND  
b.row_id=a.u_application
 
left join

svb_mdwdb.f_change_request c 
on a.sys_id=c.row_id and a.sourceinstance=c.source_id
)h

where configuration_item_application_c_key<> coalesce(row_key,case when u_application is null then 0 else -1 end) )E;
