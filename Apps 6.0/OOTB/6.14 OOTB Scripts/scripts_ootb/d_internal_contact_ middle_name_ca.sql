SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.middle_name' ELSE 'SUCCESS' END as Message
FROM
  (select a.*,b.* from (select sourceinstance,ID,middle_name from #MDS_TABLE_SCHEMA.srm_resources_final WHERE cdctype<>'D' ) as a
  inner join (select prid,sourceinstance as b_sourceinstance from #MDS_TABLE_SCHEMA.prj_resources_final WHERE cdctype<>'D' and PRISROLE=0) as b on 
  a.id=b.prid and a.sourceinstance=b.b_sourceinstance) src
  left outer join  #DWH_TABLE_SCHEMA.d_internal_contact trg
on (CONCAT('INTERNAL_CONTACT~',src.id)=trg.row_id and src.sourceinstance= trg.source_id)
where  COALESCE(src.middle_name,'')<> COALESCE(trg.middle_name,'')
;