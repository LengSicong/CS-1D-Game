set projDir "D:/Github/CS-1D-Game/CS-Game/work/planAhead"
set projName "CS-Game"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/Github/CS-1D-Game/CS-Game/work/verilog/mojo_top_0.v" "D:/Github/CS-1D-Game/CS-Game/work/verilog/reset_conditioner_1.v" "D:/Github/CS-1D-Game/CS-Game/work/verilog/miniBeta_2.v" "D:/Github/CS-1D-Game/CS-Game/work/verilog/multi_seven_seg_3.v" "D:/Github/CS-1D-Game/CS-Game/work/verilog/seven_seg_4.v" "D:/Github/CS-1D-Game/CS-Game/work/verilog/seven_seg_4.v" "D:/Github/CS-1D-Game/CS-Game/work/verilog/alu_6.v" "D:/Github/CS-1D-Game/CS-Game/work/verilog/edge_detector_7.v" "D:/Github/CS-1D-Game/CS-Game/work/verilog/button_conditioner_8.v" "D:/Github/CS-1D-Game/CS-Game/work/verilog/timer_9.v" "D:/Github/CS-1D-Game/CS-Game/work/verilog/pn_gen_10.v" "D:/Github/CS-1D-Game/CS-Game/work/verilog/Regfiles_11.v" "D:/Github/CS-1D-Game/CS-Game/work/verilog/CU_12.v" "D:/Github/CS-1D-Game/CS-Game/work/verilog/counter_13.v" "D:/Github/CS-1D-Game/CS-Game/work/verilog/seven_seg_4.v" "D:/Github/CS-1D-Game/CS-Game/work/verilog/adder_15.v" "D:/Github/CS-1D-Game/CS-Game/work/verilog/boolean_16.v" "D:/Github/CS-1D-Game/CS-Game/work/verilog/compare_17.v" "D:/Github/CS-1D-Game/CS-Game/work/verilog/shifter_18.v" "D:/Github/CS-1D-Game/CS-Game/work/verilog/pipeline_19.v" "D:/Github/CS-1D-Game/CS-Game/work/verilog/counter_20.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "D:/Github/CS-1D-Game/CS-Game/constraint/Custom.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
