SELECT COALESCE(N.row_key,case when N.row_key is null then 0 else -1 end) , COALESCE(TRG.first_build_run_key,'') from
#MDS_TABLE_SCHEMA.azure_build_definition_final SRC
left join
(select first_run.__numerify__primary_key, LKP.row_id,LKP.row_key, first_run.definitionKey, first_run.sourceinstance from
      (select B1.__numerify__primary_key, B1.definitionKey, B1.sourceinstance from
              (select build.definitionKey,build.sourceinstance,min(starttime) as first_build_time
               from #MDS_TABLE_SCHEMA.azure_build_final build 
               group by build.definitionKey,build.sourceinstance
			 ) first_build
      left join #MDS_TABLE_SCHEMA.azure_build_final B1
      ON B1.starttime = first_build.first_build_time) first_run
left join #DWH_TABLE_SCHEMA.d_build_run LKP
ON first_run.__numerify__primary_key = LKP.row_id and first_run.sourceinstance = LKP.source_id
) N
on SRC.__numerify__primary_key=N.definitionKey and SRC.sourceinstance=N.sourceinstance
left join #DWH_TABLE_SCHEMA.d_build_project TRG
on  SRC.__numerify__primary_key=TRG.row_id and SRC.sourceinstance=TRG.source_id
WHERE COALESCE(N.row_key,case when N.row_key is null then 0 else -1 end) <> COALESCE(TRG.first_build_run_key,'');
