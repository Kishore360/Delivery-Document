    select count(1)
from ibmwatson_mdsdb.task_ci_final src
join ibmwatson_mdwdb.d_task_ci_c trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
left join 
(SELECT
            a.task ,
            COUNT(b.sys_id) AS cnt
        FROM
            ibmwatson_mdsdb.task_ci_final a      
        INNER JOIN
            ibmwatson_mdsdb.task_final b 
                ON a.task = b.sys_id 
                and b.sys_class_name = 'problem'        
        GROUP BY
            1    )	lkp
			on src.task = lkp.task
		
    WHERE
        trgt.no_affected_ci_flag_c <> case 
            when lkp.cnt = 1 then 'Y' 
            else 'N' 
        end ;