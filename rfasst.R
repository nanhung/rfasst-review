devtools::install_github("JGCRI/rfasst")

library("rfasst")
library(magrittr)
data.wd <- system.file("extdata", package="rfasst")
#rpackageutils::download_unpack_zip(data_directory = data.wd,
#                                   url = "https://zenodo.org/record/4763523/files/database_basexdb_5p3_release.zip?download=1")

m1_emissions_rescale(db_path =   data.wd,
                     query_path= data.wd,
                     db_name = "database_basexdb_5p3_release",
                     prj_name = "testJOSS.dat", # give default name
                     scen_name = "Reference_gcam5p3_release", # give default name
                     queries ="queries_rfasst.xml",
                     saveOutput = F,
                     map = F)

#file.remove("testJOSS.dat")

# Need to create output/m1
dir.create("output") # should be improve
dir.create("output/m1")


m1_emissions_rescale(db_path =   data.wd,
                     query_path= data.wd,
                     db_name = "database_basexdb_5p3_release",
                     prj_name = "testJOSS.dat",
                     scen_name = "Reference_gcam5p3_release",
                     queries ="queries_rfasst.xml",
                     saveOutput = T,
                     map = F)

#
#dir.create("output") 
dir.create("output/maps")
dir.create("output/maps/m1")
dir.create("output/maps/m1/maps_em")
#
m1_emissions_rescale(db_path =   data.wd,
                     query_path= data.wd,
                     db_name = "database_basexdb_5p3_release",
                     prj_name = "testJOSS.dat",
                     scen_name = "Reference_gcam5p3_release",
                     queries ="queries_rfasst.xml",
                     saveOutput = F,
                     map = T)

# Need to provide the explanation of the output (results/data)

db_path <- data.wd
query_path <- data.wd
db_name <- "database_basexdb_5p3_release"
prj_name <- "testJOSS.dat" # (any name should work, avoid spaces just in case) 
scen_name<-"Reference_gcam5p3_release" 
queries<-"queries_rfasst.xml" # (the package includes a default query file that includes all the queries required in every function in the package, "queries_rfasst.xml")

# need to provide the detail explanation of output
em.2050 <- dplyr::bind_rows(m1_emissions_rescale(db_path,query_path,db_name,prj_name,scen_name,queries,saveOutput=F)) %>% dplyr::filter(year==2050) 
unique(em.2050$region)
unique(em.2050$pollutant)
unique(em.2050$value) # unit

m2_get_conc_pm25(db_path,query_path,db_name,prj_name,scen_name,queries,saveOutput=T,map=F)

#
m3_get_mort_pm25(db_path,query_path,db_name,prj_name,scen_name,queries,saveOutput=T, map=F) 
m3_get_daly_o3(db_path,query_path,db_name,prj_name,scen_name,queries,saveOutput=T, map=F) 
m3_get_mort_o3_ecoloss(db_path,query_path,db_name,prj_name,scen_name,queries,saveOutput=T, map=F) # not work
# Database scenarios:  Reference_gcam5p3_release                    
# Error in m3_get_mort_o3(db_path, query_path, db_name, prj_name, scen_name,  : 
#   argument "queries" is missing, with no default
m3_get_yll_o3_ecoloss(db_path,query_path,db_name,prj_name,scen_name,queries,saveOutput=T, map=F) 

#
m4_get_ryl_aot40(db_path,query_path,db_name,prj_name,scen_name,queries,saveOutput=T, map=F) 
m4_get_ryl_mi(db_path,query_path,db_name,prj_name,scen_name,queries,saveOutput=T, map=F)

ryl.aot40.2050<-dplyr::bind_rows(m4_get_ryl_aot40(db_path,query_path,db_name,prj_name,scen_name,queries,saveOutput=F, map=F)) %>% dplyr::filter(year==2050)
