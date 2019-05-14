SELECT CASE WHEN count(1)  THEN 'SUCCESS' ELSE 'FAILURE' END as Result, 
CASE WHEN count(1) THEN 'SUCCESS' ELSE 'MDS to DWH data validation failed for d_work_order.resolved_by_hd_flag_c' END as Message
FROM schneider_workdb.d_incident TRGT 
join schneider_mdsdb.hpd_help_desk_final SRC on SRC.entry_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
JOIN (select * from schneider_mdwdb.d_internal_organization where support_group_role_c='Help Desk' and group_flag='Y') lkp
ON concat('GROUP~',SRC.assigned_group_id) = lkp.row_id  AND SRC.sourceinstance = lkp.source_id   
left join (select * from schneider_mdwdb.d_lov_map  where   dimension_class='STATE~INCIDENT') lkp1 
on lkp1.src_rowid = CONCAT('STATE','~','INCIDENT','~','~','~',UPPER(SRC.status))  and lkp1.source_id = SRC.sourceinstance
 WHERE case when  lkp1.dimension_wh_code = 'RESOLVED' then 'Y' else 'N' end <> TRGT.resolved_by_hd_flag_c 
 and TRGT.soft_deleted_flag='N';