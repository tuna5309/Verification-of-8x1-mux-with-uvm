class tx_data extends uvm_sequence_item;

rand logic d0;
rand logic d1;
rand logic d2;
rand logic d3;
rand logic d4;
rand logic d5;
rand logic d6;
rand logic d7;
rand logic [3:0] sel;
logic out;




`uvm_object_utils_begin(tx_data)
  `uvm_field_int(d0,UVM_ALL_ON)
  `uvm_field_int(d1,UVM_ALL_ON)
  `uvm_field_int(d2,UVM_ALL_ON)
  `uvm_field_int(d3,UVM_ALL_ON)
  `uvm_field_int(d4,UVM_ALL_ON)
  `uvm_field_int(d5,UVM_ALL_ON)
  `uvm_field_int(d6,UVM_ALL_ON)
  `uvm_field_int(d7,UVM_ALL_ON)
  `uvm_field_int(sel,UVM_ALL_ON)
  `uvm_field_int(out,UVM_ALL_ON)	
 `uvm_object_utils_end
 

  
 function new (string  name = "tx_data");
	 super.new(name);
 endfunction 


 endclass 
 
