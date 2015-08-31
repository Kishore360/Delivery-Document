 

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from (
select case when c.dimension_class = 'STATE~INCIDENT' and c.dimension_wh_code = 'RESOLVED' 
and (b.open_to_resolve_duration/3600)>96 then 1
     when  c.dimension_wh_code != 'RESOLVED'
	 and	datediff(hours,d.opened_on,f.last_updated)<96 then NULL
else 0
end abc,datediff(hours,d.opened_on,f.last_updated),(b.open_to_resolve_duration/3600),c.dimension_class , 
b.end_to_end_duration def,d.opened_on,f.last_updated,c.dimension_wh_code
from   
 starwood_mdwdb.d_incident d 
left join ldb.f_incident b on d.row_id=b.row_id and d.source_id=b.source_id
join (select max(lastupdated) as last_updated,source_id from starwood_mdwdb.d_o_data_freshness group by 2) f
on b.source_id=f.source_id
 left join starwood_mdwdb.d_lov_map c on 
b.state_src_key =c.src_key  )
where abc<>def )i