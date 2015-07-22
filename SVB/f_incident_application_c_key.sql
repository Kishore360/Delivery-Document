
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (

select count(1) as cnt from(

select c.configuration_item_application_c_key,b.row_key,u_application 
fROM svb_mdsdb.incident_final a
 
left JOIN  

svb_mdwdb.d_configuration_item b on
a.sourceinstance=b.source_id AND  
substring(b.row_id,instr(b.row_id,'~')+1,32)=a.u_application
 
join

svb_mdwdb.f_incident c 
on a.sys_id=c.row_id and a.sourceinstance=c.source_id
)h

where configuration_item_application_c_key<> coalesce(row_key,-1) )E;
