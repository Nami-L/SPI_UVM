//incluir los headers guards

`ifndef TOP_ENV_PKG_SV
`define TOP_ENV_PKG_SV
//incluir las librerias de UVM, porque no sabemos que es lo priimero ques e compila

package top_env_pkg;
//INCLUDE DE LA MACRO
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  //archivos
  `include "top_env.sv"

endpackage : top_env_pkg

`endif  // TOP_ENV_PKG_SV
