SELECT CASE 
         WHEN cnt > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN cnt > 0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM  (SELECT Count(1) cnt
       FROM   uclahealth_mdsdb.sys_user_group_final SRC 
              JOIN (SELECT RIGHT(row_id, 32) AS row_id, 
                           source_id, 
                           assignment_group_type_c 
                    FROM   uclahealth_mdwdb.d_internal_organization) TRGT 
                ON SRC.sys_id = TRGT.row_id 
                   AND SRC.sourceinstance 
                   AND TRGT.source_id 
              LEFT JOIN uclahealth_mdsdb.sys_user_group_type_final typ 
                     ON Find_in_set(typ.sys_id, SRC.type) > 0 
       WHERE  Find_in_set (typ.NAME, TRGT.assignment_group_type_c) = 0) tmp 
