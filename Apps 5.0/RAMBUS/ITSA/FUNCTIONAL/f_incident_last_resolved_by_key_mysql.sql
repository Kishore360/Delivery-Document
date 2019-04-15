SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.incident_escalated_flag_c' ELSE 'SUCCESS' END as Message
FROM rambus_mdwdb.d_incident di 
                                                LEFT JOIN (SELECT distinct incident_key,dic.group_level_c,dio_old.level_type_c dio_old_level_type_c,
dio_new.level_type_c dio_new_level_type_c
                                FROM (select * from rambus_mdwdb.f_incident_activity where task_attribute_wh_name = 'assignment_group' and task_wh_type = 'incident') src_ft
                                                LEFT JOIN rambus_mdwdb.d_internal_contact dic ON dic.row_key = src_ft.assigned_to_on_change_c_key
                                                LEFT JOIN rambus_mdwdb.d_internal_organization dio_new ON src_ft.task_attribute_wh_new_value_key = dio_new.row_key
                                               LEFT JOIN rambus_mdwdb.d_internal_organization dio_old ON src_ft.task_attribute_wh_old_value_key = dio_old.row_key
                                WHERE dic.group_level_c like '%GSD%' and ((dio_old.level_type_c = 'L1' and dio_new.level_type_c = 'L2') or
(dio_old.level_type_c = 'L1' and dio_new.level_type_c = 'L3') or (dio_old.level_type_c = 'L2' and dio_new.level_type_c = 'L3'))) src
ON src.incident_key = di.row_key
where di.incident_escalated_flag_c <>
CASE WHEN src.group_level_c like '%GSD%' and ((dio_old_level_type_c = 'L1' and dio_new_level_type_c = 'L2') or
(dio_old_level_type_c = 'L1' and dio_new_level_type_c = 'L3') or (dio_old_level_type_c = 'L2' and dio_new_level_type_c = 'L3')) 
THEN 'Y' ELSE 'N' END
