 select b.u_change_request,a.sys_id,b.completed_date,c1.question,c.response from  mcd_mdsdb.change_request_final  a
left join   mcd_mdsdb.task_assessment_final b  on b.u_change_request=a.sys_id
 left join  mcd_mdsdb.survey_response_final c on b.instance=c.instance and b.sourceinstance=c.sourceinstance
 left join mcd_mdwdb.d_survey_question c1 on c.question=c1.row_id and c.sourceinstance=c1.source_id
where c1.question like '%potential impact%' and  a.number='CHG9017637';