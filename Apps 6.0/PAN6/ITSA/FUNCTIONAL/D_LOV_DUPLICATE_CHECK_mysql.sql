select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (
select row_id,source_id,dimension_class,count(1)
from pan6_mdwdb.d_lov 
where dimension_class not  like '%ASSET%' and dimension_class not like '%WARRANTY%' AND current_flag='Y'
AND dimension_class <>'CURRENCY' 
group by 1,2,3
having count(1)>1)a; 