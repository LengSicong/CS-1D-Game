set projDir "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/planAhead"
set projName "CS-Game"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/mojo_top_0.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/reset_conditioner_1.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/Game_fsm_2.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/alu_3.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/edge_detector_4.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/edge_detector_4.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/edge_detector_4.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/edge_detector_4.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/edge_detector_4.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/edge_detector_4.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/edge_detector_4.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/edge_detector_4.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/edge_detector_4.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/edge_detector_4.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/button_conditioner_14.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/button_conditioner_14.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/button_conditioner_14.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/button_conditioner_14.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/button_conditioner_14.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/button_conditioner_14.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/button_conditioner_14.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/button_conditioner_14.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/button_conditioner_14.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/button_conditioner_14.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/adder_24.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/boolean_25.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/compare_26.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/shifter_27.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/pipeline_28.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/pipeline_28.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/pipeline_28.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/pipeline_28.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/pipeline_28.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/pipeline_28.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/pipeline_28.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/pipeline_28.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/pipeline_28.v" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/work/verilog/pipeline_28.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/constraint/Custom.ucf" "C:/Users/12255/Desktop/CS1D/CS-1D-Game/CS-Game/constraint/io_shield.ucf" "D:/Mojo\ IDE/library/components/mojo.ucf"]
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
