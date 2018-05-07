 select 'problem' as Result,count(1) Message
from tjx_mdsdb.problem_final 
where date_format(opened_at,'%Y%m%d') <= 
 ( select date_format(max(opened_at),'%Y%m%d') from tjx_mdsdb.problem_final ) and date_format(opened_at,'%Y%m%d') >=
 date_format(date_add(date_format(( select max(opened_at) from tjx_mdsdb.problem_final ),'%Y%m%d'), INTERVAL -2 month),'%Y%m01')
 
 
 