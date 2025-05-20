//ESTO ES UN OBJETO DONDE SE COLOCAN SUS CONFIGURACIONES, ESTE LO CREA EL ENVIRONMENT Y LO METE AL DATE BASE
//DESDE EL ENVIRONMENTE SE CREA EL AGENTE Y ASU OBJETO DE CONFIGURACION Y SE CONFIGURA EL OBJETO DE CONFIGURA
//DONDE SE METE A UNA BASE DE DATOS, DESPUES EN EL AGENTE ACCESO A ESA BASE DE DATOS Y LEE ESOS OBJETOS QUE SE CONFIGURA EN EL ENVIRONEMENT
//ACCESO A ESOS VALORES
`ifndef SPI_UVC_CONFIG_SV
`define SPI_UVC_CONFIG_SV
//Extendemos la lase objetoc, es decir lo extendemos para que sea igualito para poder agregar cosas, lo extendemos como objeto
class spi_uvc_config extends uvm_object;

  `uvm_object_utils(spi_uvc_config)
//SOLO SE AGREGO ESTA LINEA, ES UN MIEMBRO QUE HACE UNA PREGUNTA, ES ACTIVO?
  uvm_active_passive_enum is_active   = UVM_ACTIVE;

  extern function new(string name = "");

endclass : spi_uvc_config


function spi_uvc_config::new(string name = "");
  super.new(name);
endfunction : new


`endif // SPI_UVC_CONFIG_SV
