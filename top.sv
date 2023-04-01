
`include "uvm_pkg.sv"
import uvm_pkg::*;

`include "mux_intf.sv"
`include "tx_data.sv"
`include "mux_covergroup.sv"
`include "mux_monitor.sv"
`include "mux_sequencer.sv"
`include "mux_driver.sv"
`include "mux_agent.sv"
`include "mux_env.sv"
`include "mux_sequence.sv"
`include "test_mux.sv"
`include "mux.v"
module top;

mux_intf cif();
mux8x1 dut(.d0(cif.d0),.d1(cif.d1),.d2(cif.d2),.d3(cif.d3),.d4(cif.d4),.d5(cif.d5),.d6(cif.d6),.d7(cif.d7),.sel(cif.sel),.out(cif.out));

initial begin
	uvm_config_db#(virtual mux_intf)::set(uvm_root::get(),"","vif",cif);
end

initial begin
	run_test("test_mux");
end
endmodule
