 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from  
starwood_mdwdb.d_location b
left join starwood_mdwdb.f_incident d on d.location_key=b.row_key
join (select max(lastupdated) as last_updated,source_id from starwood_mdwdb.d_o_data_freshness group by 2) f
on d.source_id=f.source_id
where 
timestampdiff(day, b.isac_date_c,f.last_updated)<> d.days_on_isac_c 

)e

