 SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (
select count(1) as cnt  from
 cardinalhealth_mdwdb.d_incident b
   JOIN  cardinalhealth_mdsdb.incident_final a
on  b.ROW_ID=SYS_ID and sourceinstance=b.source_id
LEFT JOIN cardinalhealth_mdsdb.sys_user_group_final sug ON sug.sys_id=a.assignment_group
AND sug.sourceinstance=a.sourceinstance
left join
(SELECT saf.documentkey,
          saf.sourceinstance,
          (COUNT(1)-SUM(CASE
                            WHEN oldvalue NOT IN
                                   (SELECT sys_id
                                    FROM cardinalhealth_mdsdb.sys_user_group_final
                                    WHERE parent IN('08c2f109f09338c4162f5e64504d3ef4',
													'097c167aac743000594bfa2ffa4bf968'))
                                 OR newvalue NOT IN
                                   (SELECT sys_id
                                    FROM cardinalhealth_mdsdb.sys_user_group_final
                                    WHERE parent IN('08c2f109f09338c4162f5e64504d3ef4',
													'097c167aac743000594bfa2ffa4bf968')) THEN 0
                            ELSE 1
                        END)) AS flag
   FROM cardinalhealth_mdsdb.sys_audit_final saf
   WHERE saf.documentkey IN
       (SELECT sys_id
        FROM cardinalhealth_mdsdb.incident_final)
     AND saf.tablename='incident'
     AND saf.fieldname='assignment_group'
   GROUP BY saf.documentkey,
            saf.sourceinstance) fcr_non_eligible ON fcr_non_eligible.documentkey=a.sys_id
AND fcr_non_eligible.sourceinstance=a.sourceinstance
 where b.soft_deleted_flag='N'    and (CASE
                                        WHEN (fcr_non_eligible.documentkey IS NULL
                                              OR a.fcr_non_eligible.flag =0)
                                             AND (sug.parent IN ('08c2f109f09338c4162f5e64504d3ef4',
                                                                    '097c167aac743000594bfa2ffa4bf968')
                                                  OR sug.sys_id IN('08c2f109f09338c4162f5e64504d3ef4',
                                                                '097c167aac743000594bfa2ffa4bf968'))
                                             AND COALESCE(TIMESTAMPDIFF(SECOND,a.opened_at,a.u_resolved_at),5000)<3600 THEN 'Y'
                                        ELSE 'N' end)<> b. first_call_resolution_flag)c