//incluir los headers guards

`ifndef SPI_UVC_PKG_SV
`define SPI_UVC_PKG_SV
//incluir las librerias de UVM, porque no sabemos que es lo priimero ques e compila

package spi_uvc_pkg;


  `include "uvm_macros.svh"
  import uvm_pkg::*;

  //archivos
  `include "spi_uvc_types.sv"
  `include "spi_uvc_sequence_item.sv"
  `include "spi_uvc_config.sv"
  `include "spi_uvc_sequencer.sv"
  `include "spi_uvc_driver.sv"
  `include "spi_uvc_monitor.sv"
  `include "spi_uvc_agent.sv"

  // Sequence library
  `include "spi_uvc_sequence_base.sv"

endpackage : spi_uvc_pkg

`endif  // SPI_UVC_PKG_SV
