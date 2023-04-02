class mux_covergroup extends uvm_subscriber#(tx_data);
	`uvm_component_utils(mux_covergroup)
	
	tx_data cover_data;
	real covereage;

 /* extern function new (string name = "",uvm_component parent);	
 extern function void build_phase(uvm_phase phase);
 extern function void write (tx_data cdata);
 extern function void extract_phase (uvm_phase phase);
 extern function void report_phase (uvm_phase phase); */



function new(string name = "" , uvm_component parent);
    	super.new(name,parent);
	    mux_cover= new();
   endfunction   

virtual function build_phase(uvm_phase phase);
endfunction




covergroup mux_cover;
		
		sel_cp:coverpoint cover_data.sel {
			bins sel000 = {3'b000};
			bins sel001 = {3'b001};
			bins sel010 = {3'b010};
			bins sel011 = {3'b011};
			bins sel100 = {3'b100};
			bins sel101 = {3'b101};
			bins sel110 = {3'b110};
			bins sel111 = {3'b111};
		}
		
		d0_cp:coverpoint cover_data.d0 {
			   bins d0_0 = {0};
			   bins d0_1 = {1};
		}
		
		d1_cp:coverpoint cover_data.d1 {
			   bins d1_0 = {0};
			   bins d1_1 = {1};
		}
		
		d2_cp:coverpoint cover_data.d2 {
			   bins d2_0 = {0};
			   bins d2_1 = {1};
		}
		
		d3_cp:coverpoint cover_data.d3 {
			   bins d3_0 = {0};
			   bins d3_1 = {1};
		}
		
		d4_cp:coverpoint cover_data.d4 {
			   bins d4_0 = {0};
			   bins d4_1 = {1};
		}
		
		d5_cp:coverpoint cover_data.d5 {
			   bins d5_0 = {0};
			   bins d5_1 = {1};
		}
		
		d6_cp:coverpoint cover_data.d6 {
			   bins d6_0 = {0};
			   bins d6_1 = {1};
		}
		
		d7_cp:coverpoint cover_data.d7 {
			   bins d7_0 = {0};
			   bins d7_1 = {1};
		}
		
		
	/*	sel000_X_d0:cross sel_cp, d0_cp{
			bins valid = binsof(sel_cp.sel000) && (binsof(d0_cp.d0_0) || binsof(d0_cp.d0_1));
			ignore_bins invalid = binsof(sel_cp.sel001 || sel_cp.sel010 || sel_cp.sel011 || sel_cp.sel100 || sel_cp.sel101  || sel_cp.sel110 || sel_cp.sel111 ) && (binsof(d0_cp.d0_0) || binsof(d0_cp.d0_1));
		}
		
		
		sel001_X_d1:cross sel_cp, d1_cp{
			bins valid = binsof(sel_cp.sel001) && (binsof(d1_cp.d1_0) || binsof(d1_cp.d1_1));
			ignore_bins invalid = binsof(sel_cp.sel000 || sel_cp.sel010 || sel_cp.sel011 || sel_cp.sel100 || sel_cp.sel101  || sel_cp.sel110 || sel_cp.sel111 ) && (binsof(d1_cp.d1_0) || binsof(d1_cp.d1_1));
		}
		
		sel010_X_d2:cross sel_cp, d2_cp{
			bins valid = binsof(sel_cp.sel010) && (binsof(d2_cp.d2_0) || binsof(d2_cp.d2_1));
			ignore_bins invalid = binsof(sel_cp.sel000 || sel_cp.sel001 || sel_cp.sel011 || sel_cp.sel100 || sel_cp.sel101  || sel_cp.sel110 || sel_cp.sel111 ) && (binsof(d2_cp.d2_0) || binsof(d2_cp.d2_1));
		}
		
		sel011_X_d3:cross sel_cp, d3_cp{
			bins valid = binsof(sel_cp.sel011) && (binsof(d3_cp.d3_0) || binsof(d3_cp.d3_1));
			ignore_bins invalid = binsof(sel_cp.sel000 || sel_cp.sel001 || sel_cp.sel010 || sel_cp.sel100 || sel_cp.sel101  || sel_cp.sel110 || sel_cp.sel111 ) && (binsof(d3_cp.d3_0) || binsof(d3_cp.d3_1));
		}
		
		sel100_X_d4:cross sel_cp, d4_cp{
			bins valid = binsof(sel_cp.sel100) && (binsof(d4_cp.d4_0) || binsof(d4_cp.d4_1));
			ignore_bins invalid = binsof(sel_cp.sel000 || sel_cp.sel001 || sel_cp.sel010 || sel_cp.sel011 || sel_cp.sel101  || sel_cp.sel110 || sel_cp.sel111 ) && (binsof(d4_cp.d4_0) || binsof(d4_cp.d4_1));
		}
		
		sel101_X_d5:cross sel_cp, d5_cp{
			bins valid = binsof(sel_cp.sel101) && (binsof(d5_cp.d5_0) || binsof(d5_cp.d5_1));
			ignore_bins invalid = binsof(sel_cp.sel000 || sel_cp.sel001 || sel_cp.sel010 || sel_cp.sel011 || sel_cp.sel100  || sel_cp.sel110 || sel_cp.sel111 ) && (binsof(d5_cp.d5_0) || binsof(d5_cp.d5_1));
		}
		
		sel110_X_d6:cross sel_cp, d6_cp{
			bins valid = binsof(sel_cp.sel110) && (binsof(d6_cp.d6_0) || binsof(d6_cp.d6_1));
			ignore_bins invalid = binsof(sel_cp.sel000 || sel_cp.sel001 || sel_cp.sel010 || sel_cp.sel011 || sel_cp.sel100  || sel_cp.sel101 || sel_cp.sel111 ) && (binsof(d6_cp.d6_0) || binsof(d6_cp.d6_1));
		}
		
		sel111_X_d7:cross sel_cp, d7_cp{
			bins valid = binsof(sel_cp.sel111) && (binsof(d7_cp.d7_0) || binsof(d7_cp.d7_1));
			ignore_bins invalid = binsof(sel_cp.sel000 || sel_cp.sel001 || sel_cp.sel010 || sel_cp.sel011 || sel_cp.sel100  || sel_cp.sel101 || sel_cp.sel110 ) && (binsof(d7_cp.d7_0) || binsof(d7_cp.d7_1));
		}
	*/
	
	endgroup 
	



virtual function void write (tx_data cdata);
	cover_data = cdata;
	mux_cover.sample();
endfunction

virtual function void extract_phase(uvm_phase phase);
		covarage=mux_cover.get_covarage();
endfunction
	
virtual function void report_phase(uvm_phase phase);
		 `uvm_info(get_type_name(), $sformatf("Coverage is: %f", covarage), UVM_LOW)
endfunction 




endclass 






	  
		

	
	
	
	
