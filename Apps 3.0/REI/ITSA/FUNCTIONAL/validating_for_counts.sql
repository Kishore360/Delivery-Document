SELECT CASE WHEN cnt<>cntt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt<>cntt THEN 'Failure' ELSE 'Data Matched' END as Message
 FROM
(

select RES1.cnt as cnt, RES2.cntt from

(select count(sys_id) as cnt from
rei_mdsdb.pm_project_final) as RES1,

(select count(row_id) as cntt 
from rei_mdwdb.f_project_c
where soft_deleted_flag='N') RES2

)a;



