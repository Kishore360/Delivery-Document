 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdwdb.d_defect_rm_c a
JOIN  cardinalhealth_mdwdb.f_defect_rm_c b
on  b.row_id = a.row_id and a.source_id=b.source_id
join cardinalhealth_mdwdb.d_lov_map lkp
on b.status_rm_src_c_key= lkp.src_key 
join cardinalhealth_mdwdb.d_o_data_freshness df 
on b.source_id=df.source_id 
Where 
case when lkp.dimension_wh_code IN ('CLOSED','RESOLVED') then 
(SELECT 5 * ((DATEDIFF(a.closed_date,a.opened_date) ) DIV 7) 
+ MID('0123455501234445012333450122234501101234000123450', 7 * WEEKDAY(a.opened_date) 
+ WEEKDAY(a.closed_date) + 1, 1))+1 
else 
(SELECT 5 * ((DATEDIFF(df.lastupdated,a.opened_date) ) DIV 7) 
+ MID('0123455501234445012333450122234501101234000123450', 7 * WEEKDAY(a.opened_date) 
+ WEEKDAY(df.lastupdated) + 1, 1))+1 end<> b.business_days)c

