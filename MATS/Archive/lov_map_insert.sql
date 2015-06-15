
use itsm_workdb;
truncate table d_lov_map;

LOAD DATA LOCAL INFILE 'C:\\Users\\Admin\\Desktop\\lov_map_insert.txt'
INTO TABLE d_lov_map                                         
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES (@Col1,@Col2,@Col3,@Col4,@Col5,@Col6,@Col7,@Col8,@Col9,@Col10,@Col11,@Col12,
@Col13,@Col14,@Col15,@Col16,@Col17,@Col18,@Col19,@Col20,@Col21,@Col22,@Col23,@Col24,@Col25,
@Col26,@Col27,@Col28
) 
SET row_key=convert(case when @Col1= '' then NULL else  @Col1 end using utf8) ,
row_dn_key=convert(case when @Col2= '' then NULL else  @Col2 end using utf8) ,
row_current_key=convert(case when @Col3= '' then NULL else  @Col3 end using utf8) ,
row_id=convert(case when @Col4= '' then NULL else  @Col4 end using utf8) ,
source_id=convert(case when @Col5= '' then NULL else  @Col5 end using utf8) ,
etl_run_number=convert(case when @Col6= '' then NULL else  @Col6 end using utf8) ,
src_rowid=convert(case when @Col7= '' then NULL else  @Col7 end using utf8) ,
wh_rowid=convert(case when @Col8= '' then NULL else  @Col8 end using utf8) ,
dimension_class=convert(case when @Col9= '' then NULL else  @Col9 end using utf8) ,
dimension_type=convert(case when @Col10= '' then NULL else  @Col10 end using utf8) ,
dimension_subtype=convert(case when @Col11= '' then NULL else  @Col11 end using utf8) ,
dimension_code=convert(case when @Col12= '' then NULL else  @Col12 end using utf8) ,
wh_dimension_class=convert(case when @Col13= '' then NULL else  @Col13 end using utf8) ,
wh_dimension_type=convert(case when @Col14= '' then NULL else  @Col14 end using utf8) ,
wh_dimension_subtype=convert(case when @Col15= '' then NULL else  @Col15 end using utf8) ,
dimension_wh_code=convert(case when @Col16= '' then NULL else  @Col16 end using utf8) ,
src_key=convert(case when @Col17= '' then NULL else  @Col17 end using utf8) ,
wh_key=convert(case when @Col18= '' then NULL else  @Col18 end using utf8) ,
soft_deleted_flag=convert(case when @Col19= '' then NULL else  @Col19 end using utf8) ,
created_by=convert(case when @Col20= '' then NULL else  @Col20 end using utf8) ,
changed_by=convert(case when @Col21= '' then NULL else  @Col21 end using utf8) ,
created_on=convert(case when @Col22= '' then NULL else  @Col22 end using utf8) ,
changed_on=convert(case when @Col23= '' then NULL else  @Col23 end using utf8) ,
current_flag=convert(case when @Col24= '' then NULL else  @Col24 end using utf8) ,
effective_from=convert(case when @Col25= '' then NULL else  @Col25 end using utf8) ,
effective_to=convert(case when @Col26= '' then NULL else  @Col26 end using utf8) ,
dw_inserted_on=convert(case when @Col27= '' then NULL else  @Col27 end using utf8) ,
dw_updated_on=convert(case when @Col28= '' then NULL else  @Col28 end using utf8) 
