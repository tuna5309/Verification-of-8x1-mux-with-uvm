
class test_mux extends uvm_test;
	`uvm_component_utils(test_mux)

uvm_factory factory;
mux_env env;
mux_sequence seq_test;





function new(string name = "", uvm_component parent);
	super.new(name,parent);
endfunction : new

function void build_phase(uvm_phase phase);	
 env:mux_env::type_id::create("env",this);
endfunction : build_phase


function void end_of_elobartion_phase(uvm_phase phase);
	      $display("End of eleboration phase in agent");
endfunction : end_of_elobartion_phase

task run_phase(uvm_phase phase);
	phase.raise_objection(this);
	`uvm_warning("","8X1 MUX TEST")
	seq_test=mux_sequence::type_id::create("seq_test",this);
	seq_test.start(env.agent.sequencer);
	phase.drop_objection(this);
endtask :run_phase	
