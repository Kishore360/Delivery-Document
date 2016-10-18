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
 cardinalhealth_mdwdb.f_defect_rm_c a ON 
b.row_key = a.defect_c_key
    left join cardinalhealth_mdwdb.d_lov_map br ON a.status_rm_src_c_key = br.src_key 
AND br.dimension_class = 'STATUS_C~TASK'
    where
        CASE
            WHEN br.dimension_wh_code = 'OPEN' THEN 'PENDING'
            WHEN
              
                    date(b.due_date) >= date(b.closed_date)
            THEN
                'ACHIEVED'
            ELSE 'BREACHED'
        END <> b.sla_status) c




