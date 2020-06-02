SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_organization.emp_count' ELSE 'SUCCESS' END as Message
FROM
(
select A.`group` as grp, count(B.sys_id) as qa_count from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_user_grmember_final WHERE CDCTYPE<>'D') A
join ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_user_final WHERE CDCTYPE<>'D') B
ON A.`user`=B.sys_id 
and A.Sourceinstance=B.Sourceinstance
where B.active=1
group by A.`group`
) src
left outer join #DWH_TABLE_SCHEMA.d_internal_organization tgt
on tgt.row_id = concat('GROUP~',src.grp) and tgt.group_flag='Y'
where tgt.emp_count <> src.qa_count
