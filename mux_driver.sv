class mux_driver extends uvm_driver#(tx_data);
	
	`uvm_component_utils(mux_driver)
	
	
	virtual mux_intf vif;
 


function new(string name = "" , uvm_component parent);
 super.new(name,parent);	
endfunction : new


function void build_phase(uvm_phase phase);
   if(!(uvm_config_db#(virtual mux_intf)::get(this,"","vif",vif))) begin
	   `uvm_fatal("driver","unable to get interface")
end
endfunction 


task run_phase(uvm_phase phase);
tx_data tx_d;	
forever begin 
	seq_item_port.get_next_item(tx_d);
		
	 case(tx_d.sel)
		3'b000: begin 	 
				vif.sel <= tx_d.sel;
				vif.d0  <= tx_d.d0;
		    end
		3'b001: begin 	 
				vif.sel <= tx_d.sel;
				vif.d1  <= tx_d.d1;
		    end	
		3'b010: begin 	 
				vif.sel <= tx_d.sel;
				vif.d2  <= tx_d.d2;
		    end	
		3'b011: begin 	 
				vif.sel <= tx_d.sel;
				vif.d3  <= tx_d.d3;
		    end	
		3'b100: begin 	 
				vif.sel <= tx_d.sel;
				vif.d4  <= tx_d.d4;
		    end	
		3'b101: begin 	 
				vif.sel <= tx_d.sel;
				vif.d5  <= tx_d.d5;
		    end	
		3'b110: begin 	 
				vif.sel <= tx_d.sel;
				vif.d6  <= tx_d.d6;
		    end	
		3'b111: begin 	 
				vif.sel <= tx_d.sel;
				vif.d7  <= tx_d.d7;
		    end
endcase  	
		tx_d.print();
		seq_item_port.item_done();
	end					
endtask 

endclass 

