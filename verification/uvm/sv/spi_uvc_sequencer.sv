`ifndef SPI_UVC_SEQUENCER_SV
`define SPI_UVC_SEQUENCER_SV


//MANDA EN AUTOMATICO, AGARRA LA TRANSATION T SE LA MANDA AL DRIVER, NO SE MODIFICA
//SECOMUNICA CON LA SECUENCIA
//EL SEQUENCER SE COMUNICACA CON LA SECUENCIA(QUE TIENE TRANSACTIONES) Y ESA SEQUENCIA SE EJECUTA EN UN SEQUENCER
//TRANSACTION POR TRANSACTION EL SEQUENCER SE LO MANDA AL DRIVER

class spi_uvc_sequencer extends uvm_sequencer #(spi_uvc_sequence_item);

`uvm_component_utils(spi_uvc_sequencer)

  spi_uvc_config m_config;

  extern function new(string name, uvm_component parent);

  extern function void build_phase(uvm_phase phase);

endclass : spi_uvc_sequencer


function spi_uvc_sequencer::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new


function void spi_uvc_sequencer::build_phase(uvm_phase phase);
  if (!uvm_config_db#(spi_uvc_config)::get(get_parent(), "", "config", m_config)) begin
    `uvm_fatal(get_name(), "Could not retrieve spi_uvc_config from config db")
  end
endfunction : build_phase

`endif // SPI_UVC_SEQUENCER_SV
