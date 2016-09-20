SELECT CASE WHEN cnt<>cntt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt<>cntt THEN concat('Failure',(cnt-cntt)) ELSE 'Data Matched' END as Message
 FROM
(

select RES1.cnt as cnt, RES2.cntt from

(select count(SRC.sys_id) as cnt
FROM bbandt_mdsdb.incident_final SRC 
left join bbandt_mdsdb.sys_user_group_final lkp 
on SRC.assignment_group = lkp.sys_id 
and SRC.sourceinstance = lkp.sourceinstance
 where 
 ((lkp.name not like 'ITSM-LOB-Branchinfo%' and name not like 'ITSM-LOB-HumanSystems%' and name not like 'ITSM-LOB-CPS%'
and name not like 'ITSM-LOB-LoanServices%' and name not like 'ITSM-LOB-Wealth%') or lkp.name is null)
 ) as RES1,

(select count(row_id)-2 as cntt 
from bbandt_mdwdb.d_incident where soft_deleted_flag='N') RES2

)a