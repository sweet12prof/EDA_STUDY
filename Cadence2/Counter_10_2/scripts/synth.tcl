#----------------set liberty path
set_db init_lib_search_path /eda/pdk/FreePDK45/osu_soc/lib/files/

#----------------set script path
set_db script_search_path /home/sweet12prof/Desktop/CAD/Cadence2/Counter_10_2/scripts/

#----------------set hdl path 
set_db init_hdl_search_path /home/sweet12prof/Desktop/CAD/Cadence2/Counter_10_2/hdl/

#----------------set technology library
set_db library gscl45nm.lib

#-----------------read HDL files 

#-------SET_HDL Version
set_db hdl_vhdl_read_version 2008

#--------set hdl_language
set_db hdl_language vhdl

#-------set file_list
set file_list { adder4_behavorial.vhd counterdatapath_behavorial.vhd comparator_10_datatflow.vhd reg_4bit_behavorial.vhd Counter_Control_behave.vhd topLevel_behavior.vhd }

#--------read file_list
read_hdl $file_list

#--------elaborate 
elaborate 


