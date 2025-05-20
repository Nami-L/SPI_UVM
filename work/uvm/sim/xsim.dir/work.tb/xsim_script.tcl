set_param project.enableReportConfiguration 0
load_feature core
current_fileset
xsim {work.tb} -testplusarg UVM_TESTNAME=top_test -testplusarg UVM_VERBOSITY=UVM_DEBUG -wdb {/home/nami/SPI_UVM/work/uvm/wdb/tb.wdb} -autoloadwcfg -tclbatch {/home/nami/SPI_UVM/verification/uvm/scripts/vivado/run.tcl} -onerror stop -sv_seed 1
