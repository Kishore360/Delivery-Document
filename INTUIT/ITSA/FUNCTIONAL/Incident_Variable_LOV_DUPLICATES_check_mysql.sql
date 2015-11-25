 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
select row_id,text,value,count(1) from intuit_mdwdb.d_variable_lov_c 
group by 1,2,3
having count(1)>1
)A)TEMP