//include headers 
`ifndef TOP_ENV_SV
`define TOP_ENV_SV

//Externder una clase
class top_env extends uvm_env;
//Como es un componente, colocar el macro de componente
`uvm_component_utils(top_env)
//CREAR UN AGENTE: EN ENVIRONMENT INCLUYE EL AGENTE
//Crear el ambien te configuracion minuto1:10:7

//spi_uvc_config m_spi_config;
spi_uvc_config m_spi_config;
spi_uvc_agent m_spi_agent; // CREACION DEL AGENTE, HAY QUE CONSTRUIRLO m:miembro

//va a tener 3 fases, constructos, build, connect

//Agregar primero el constructor
extern function new(string name, uvm_component parent);
// Crear el environment
//UVM trabaja por fases, build, run phases,clenaup phases.
//en la fase de build phase, en esta fase, se instancia, crear obejetos
extern function void build_phase(uvm_phase phase);
//connect porque hay modulos adentro del environmente para conectar
extern function void connect_phase(uvm_phase phase);

endclass: top_env

//Colocar primero el constructor por default
function top_env::new(string name, uvm_component parent);
super.new(name,parent);
endfunction:new

//Declarar enl build

function void top_env::build_phase(uvm_phase phase);
//CONSTRUIR EL AGENTE QUE HEMOS CREADO  
m_spi_config = spi_uvc_config::type_id::create("m_spi_config");
m_spi_config.is_active = UVM_ACTIVE;
uvm_config_db#(spi_uvc_config)::set(this, "m_spi_agent*", "config", m_spi_config);
m_spi_agent = spi_uvc_agent::type_id::create("m_spi_agent",this);
endfunction:build_phase

function void top_env::connect_phase(uvm_phase phase);
endfunction:connect_phase

`endif // TOP_ENV_SV
