class mux_agent extends uvm_agent;
	`uvm_component_utils(mux_agent)

	mux_driver driver;
	mux_sequencer sequencer;
	mux_monitor monitor;
	
function new(string name="",uvm_component parent);
		super.new(name,parent);
endfunction 

function void build_phase(uvm_phase phase);
 driver=mux_driver::type_id::create("driver",this);
 sequencer=mux_sequencer::type_id::create("sequencer",this);
 monitor=mux_monitor::type_id::create("monitor",this);	
endfunction : build_phase


function void connect_phase(uvm_phase phase);
 	driver.seq_item_port.connect(sequencer.seq_item_export);
endfunction : connect_phase 
endclass
