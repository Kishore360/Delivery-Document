SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem_task.age' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) as CNT
from
ntrs_mdsdb.u_problem_task_final SRC
join
ntrs_mdwdb.d_problem_task TRGT
on (SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
join
ntrs_mdwdb.d_lov LKP
on ((COALESCE(CONCAT('STATE','~','problem_task','~','','',UPPER(SRC.state)),'UNSPECIFIED'))=LKP.row_id and SRC.sourceinstance=LKP.source_id
and date_format(CONVERT_TZ(SRC.opened_at,'GMT','US/Central'), '%Y-%m-%d %H:%i:%s') between LKP.effective_from AND LKP.effective_to)
join 
ntrs_mdwdb.d_lov_map LKP1
on (LKP.row_key=LKP1.src_key and LKP1.dimension_class = 'STATE~PROBLEM_TASK' and LKP1.dimension_wh_code !='CLOSED')
where
TRGT.age=
if(timestampdiff(DAY,CONVERT_TZ(TRGT.opened_on,'US/Central','GMT'),CONVERT_TZ((SELECT max(lastupdated) FROM ntrs_mdwdb.d_o_data_freshness 
WHERE
TRGT.source_id=d_o_data_freshness.source_id 
and CONSUMER_ID = 3),'US/Central','GMT'))>0,timestampdiff(DAY,CONVERT_TZ(TRGT.opened_on,'US/Central','GMT'),CONVERT_TZ((SELECT max(lastupdated) 
FROM
ntrs_mdwdb.d_o_data_freshness 
WHERE
TRGT.source_id=d_o_data_freshness.source_id 
and CONSUMER_ID = 3),'US/Central','GMT')),0)
and SRC.cdctype='X') temp;
