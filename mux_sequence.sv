class mux_sequence extends uvm_sequence#(tx_data);

  `uvm_object_utils(mux_sequence)

  tx_data tx_d;



function new (string  name = "mux_sequence");
   super.new(name);
endfunction


task body();
 tx_d:tx_data::type_id::create("tx_d");
  repeat(1)
    begin
  start_item(tx_d);
      if(!(tx_d.randomize()));
        begin
          `uvm_error(get_type_name(),"RANDOMÝZE ERROR FOUND \n  ")
        end
        finish_item(tx_d);
    end
endtask 




   
endclass
