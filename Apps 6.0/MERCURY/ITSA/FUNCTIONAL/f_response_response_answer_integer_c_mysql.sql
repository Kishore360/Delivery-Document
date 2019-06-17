 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1)

from  mercury_mdsdb.asmt_assessment_instance_question_final a 

JOIN mercury_mdsdb.asmt_assessment_instance_final b on (a.instance = b.sys_id)

join  

 mercury_mdwdb.fs_response fr on fr.row_id=a.sys_id

where  fr.response_answer_integer_c <>

CASE

   WHEN d.actual_value < 0 THEN d.string_value

   WHEN d.string_value is NOT NULL and d.actual_value is NOT NULL THEN CONCAT(d.actual_value ,' - ',d2.string_value)

   WHEN d.string_value is NOT NULL and d.actual_value is NULL THEN d2.string_value

   WHEN d.string_value is NULL and d.actual_value is NOT NULL THEN d.actual_value

   WHEN d.string_value is NULL and d.actual_value is NULL then NULL END

 WHERE  actual_value is NOT NULL ;

 

)c