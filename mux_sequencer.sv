class mux_sequencer extends uvm_sequencer#(tx_data);
	

`uvm_component_utils(mux_sequencer)
	


function new(string name = "",uvm_component parent);
	super.new(name,parent);		
endfunction 
endclass 
