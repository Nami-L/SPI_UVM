`ifndef SPI_UVC_SEQUENCE_BASE_SV
`define SPI_UVC_SEQUENCE_BASE_SV

//AQUI PONEMOS TRANSACIONES DIFERENTES, PORE EJEMPLO
//SECUENCIAS EN ESPECIFICO
//SECUECNIAS DE 1 Y 0
//SECUENCIAS ALEATORIAS
//SECUENCIAS CON RANGOS ESPECIFICOS 
//ETC

class spi_uvc_sequence_base extends uvm_sequence #(spi_uvc_sequence_item);

  `uvm_object_utils(spi_uvc_sequence_base)

  //  PARA VOLVER ALEATORIA LA TRANSACTION SE LE PONE EL RAND
  rand spi_uvc_sequence_item m_trans;//video 5 minuto 3. Como REQ ya esta declarado, puedo ocupar REQ


  extern function new(string name ="");
  extern virtual task body();


endclass: spi_uvc_sequence_base


function spi_uvc_sequence_base::new(string name);
  super.new(name);

  //SOLO VOY A MANDAR UNA TRANSACTION
  m_trans = spi_uvc_sequence_item::type_id::create("m_trans");
endfunction : new


task spi_uvc_sequence_base::body();
start_item(m_trans);
finish_item(m_trans);
endtask : body

`endif // SPI_UVC_SEQUENCE_BASE_SV
