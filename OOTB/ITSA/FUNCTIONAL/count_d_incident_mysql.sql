
SELECT CASE WHEN cnt<>cntt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt<>cntt THEN concat('Failure',(cnt-cntt)) ELSE 'Data Matched' END as Message
 FROM
(

select RES1.cnt as cnt, RES2.cntt from

(select count(sys_id) as cnt from
<<tenant>>_mdsdb.incident_final) as RES1,

(select count(row_id)-2 as cntt 
from <<tenant>>_mdwdb.d_incident) RES2
<<<<<<< HEAD
=======

>>>>>>> 243ba958dffd6344a7970ae57f759ff20d735924

)a; 


