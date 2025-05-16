//Colocar GUARDS
//COLOCAR LA CLASE  UE SE EXTIENDE DE ..
//COLOCAR UVM COMPONENTE - OBJETO}
//COLOCAR LAS FASES
`ifndef SPI_UVC_AGENTE_SV
`define SPI_UVC_AGENTE_SV

class spi_uvc_agent extends uvm_agent;

//POR DEFECTO EL AGENT DEBE TENER 4 CLASES: SPI_UVC_DRIVER, MONITOR, SEQUENCER, CONFIG:OBJETO DE CONFIGURACION

  `uvm_component_utils(spi_uvc_agent)

//EXTENDER LAS 4 CLASES.
  uvm_analysis_port #(spi_uvc_sequence_item) analysis_port;

spi_uvc_config m_config;
spi_uvc_sequencer m_sequencer;
spi_uvc_driver m_driver;
spi_uvc_monitor m_monitor;




  //COLOCAR LAS FASES

  extern function new(string name, uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);


endclass: spi_uvc_agent

//COLOCAR POR DEFAULT EL constructor    

function spi_uvc_agent::new(string name, uvm_component parent);
super.new(name, parent);
endfunction :new

//build
function void spi_uvc_agent::build_phase(uvm_phase phase);
//CREAR LAS CLASES
// Si config es activo entonces se instancia el sequencer y el driver
  if (!uvm_config_db#(spi_uvc_config)::get(this, "", "config", m_config)) begin
    `uvm_fatal(get_name(), "Could not retrieve spi_uvc_config from config db")
  end
  
if(m_config.is_active == UVM_ACTIVE) begin
    m_sequencer = spi_uvc_sequencer::type_id::create("m_sequencer",this);
    m_driver    = spi_uvc_driver::type_id::create("m_driver",this);
end
//EL MONITOR SIEMPRE SE INSTANCIA
m_monitor = spi_uvc_monitor::type_id::create("m_monitor",this);
  analysis_port = new("analysis_port", this);

endfunction: build_phase
//connect

function void spi_uvc_agent::connect_phase(uvm_phase phase);
//SI ES ACTIVO EL COMPONENTE, ENTONCES EL DRIVER DEBE CONECTARSE CON EL SEQUENCER
//SEQUENCER CREA TODOS LOS PAQUETES
if(m_config.is_active == UVM_ACTIVE) begin
    m_driver.seq_item_port.connect(m_sequencer.seq_item_export);

end
  m_monitor.analysis_port.connect(this.analysis_port);

endfunction: connect_phase

`endif // SPI_UVC_AGENTE_SV
