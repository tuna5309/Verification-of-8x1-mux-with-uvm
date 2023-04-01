class mux_env extends uvm_env;
	`uvm_component_utils(mux_env)
	
	mux_agent agent; 
	mux_covergroup cove;



function new(string name = "",uvm_component parent);
	super.new(name); 
endfunction : new

function void  build_phase(uvm_phase phase);
	super.build_phase(phase);
	agent=mux_agent::type_id::create("agent",this);
	cove=mux_covergroup::type_id::create("cove",this);
endfunction 


function void connect_phase(uvm_phase phase);
  agent.monitor.monitor_port.connect(cove.analysis_export);
endfunction : connect_phase

endclass 
