//incluir los headers guards

`ifndef TOP_TEST_PKG_SV
`define TOP_TEST_PKG_SV
//incluir las librerias de UVM, porque no sabemos que es lo priimero ques e compila

package top_test_pkg;


  `include "uvm_macros.svh"
  import uvm_pkg::*;

  //archivos
  `include "top_test.sv"

endpackage : top_test_pkg

`endif  // TOP_TEST_PKG_SV
