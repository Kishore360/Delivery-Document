SELECT 
    CASE
        WHEN cnt > 0 THEN 'FAILURE'
        ELSE 'SUCCESS'
    END AS Result,
    CASE
        WHEN cnt > 0 THEN 'Data did not Match.'
        ELSE 'Data Matched'
    END AS Message
FROM
    (select 
        count(1) as cnt
    from
       
     cardinalhealth_mdwdb.d_defect_rm_c b  JOIN
 cardinalhealth_mdsdb.rm_defect_final a ON 
b.row_id = a.sys_id AND a.sourceinstance = b.source_id
    
    where
        NULL <> b.sla_status) c


