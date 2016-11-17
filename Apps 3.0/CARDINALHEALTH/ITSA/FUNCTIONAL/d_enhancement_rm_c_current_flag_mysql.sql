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
       
     cardinalhealth_mdwdb.d_enhancement_rm_c b      
    where
        'Y' <> b.current_flag) c


