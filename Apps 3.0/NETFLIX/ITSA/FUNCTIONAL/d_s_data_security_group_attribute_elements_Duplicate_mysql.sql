SELECT CASE WHEN cnt  THEN 'FAILURE' ELSE 'SUCCESS' END AS Result ,CASE WHEN cnt  THEN 'Data did not Match.'  
ELSE 'Data Matched' END AS Message   
FROM( Select count(cnt) as cnt 
from( 
select row_id,source_id,count(1) as cnt 
from  
netflix_mdwdb.d_s_data_security_group_attribute_elements  
group by 1,2 
having count(1)>1)c )a 
