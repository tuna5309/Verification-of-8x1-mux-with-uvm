class mux_monitor extends uvm_monitor; 
	`uvm_component_utils(mux_monitor)
	
	tx_data mon_tx;
	virtual mux_intf vif;
	uvm_analysis_port#(tx_data) monitor_port;
	uvm_factory factory;


 function new(string name = "", uvm_component parent);
 		super.new(name,parent);
 endfunction : new
 

 virtual function void build_phase(uvm_phase phase);
  		if (!(uvm_config_db#(virtual mux_intf)::get(this,"","vif",vif))) begin
	  			`uvm_fatal("monitor","monitor cant get interface")
  		end
  		
  		monitor_port=new("monitor_port",this);
  		mon_tx:tx_data::type_id::create("mon_tx",this);
 endfunction : build_phase
 

 virtual task run_phase(uvm_phase phase);
 	forever
	begin @(vif.d1 or vif.d2 or vif.d3 or vif.d4 or vif.d5 or vif.d6 or vif.d7 or vif.sel or vif.out); 
 			mon_tx.d0=vif.d0;
 			mon_tx.d1=vif.d1;	
 			mon_tx.d2=vif.d2; 	
 			mon_tx.d3=vif.d3; 	
 			mon_tx.d4=vif.d4; 	
 			mon_tx.d5=vif.d5; 	
 			mon_tx.d6=vif.d6; 	
 			mon_tx.d7=vif.d7;
 			mon_tx.sel=vif.sel;
			mon_tx.out=vif.out;
	 		monitor_port.write(mon_tx);
 		end 
 endtask : run_phase	

endclass
