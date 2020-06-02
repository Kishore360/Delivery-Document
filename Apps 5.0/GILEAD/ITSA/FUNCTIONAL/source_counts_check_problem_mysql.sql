 select 'problem' as Result,count(1) Message
from gilead_mdsdb.problem_final 
where date_format(convert_tz(opened_at,'GMT','America/New_York'),'%Y%m%d') <= 
 ( select date_format(max(convert_tz(opened_at,'GMT','America/New_York')),'%Y%m%d') from gilead_mdsdb.problem_final ) and date_format(convert_tz(opened_at,'GMT','America/New_York'),'%Y%m%d') >=
 date_format(date_add(date_format(( select max(convert_tz(opened_at,'GMT','America/New_York')) from gilead_mdsdb.problem_final ),'%Y%m%d'), INTERVAL -2 month),'%Y%m01')
 
 
 