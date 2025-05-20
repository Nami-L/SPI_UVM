//incluir los headers guards

`ifndef TOP_TEST_PKG_SV
`define TOP_TEST_PKG_SV
//incluir las librerias de UVM, porque no sabemos que es lo priimero ques e compila

package top_test_pkg;


  `include "uvm_macros.svh"
  import uvm_pkg::*;
    import spi_uvc_pkg::*; //SE PEGA ABAJO DE UVM TANTO EN EL TEST COMO EL ENVIRONMETE
  import top_env_pkg::*; // SE DEBE COMPILAR PRIMERO EL ENV, ES DECIR SE COMPILE ANTES
        //archivos
    `include "top_test_vseq.sv"

  `include "top_test.sv"

endpackage : top_test_pkg

`endif  // TOP_TEST_PKG_SV
