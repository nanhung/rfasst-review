library(rgcam)
SAMPLE.GCAMDBLOC <- system.file("extdata", package="rgcam")
SAMPLE.QUERIES <- system.file("ModelInterface", "sample-queries.xml", package="rgcam")
conn <- localDBConn(SAMPLE.GCAMDBLOC, "sample_basexdb")


library("rfasst")

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

if (!dir.exists("output")) dir.create("output")

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



