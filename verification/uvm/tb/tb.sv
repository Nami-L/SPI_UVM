module tb;
  //Siemmpre pregar estas dos lineas
  `include "uvm_macros.svh"  //incluye todos los macors
  import uvm_pkg::*;
  import top_test_pkg::*;

  //para llamar atraer el top test, incluimos in paquete que tenga todos los paquetres

  //Colocar la señal de reloj
  localparam time CLK_PERIOD = 10ns;
  logic clk_i = 0;
  always #(CLK_PERIOD / 2) clk_i = ~clk_i;

  //Reset signal

  logic reset_i = 0;
  initial begin
    repeat (2) @(posedge clk_i);
    reset_i = 1;
    @(posedge clk_i);
    reset_i = 0;
  end




  //Interface
  //spi_uvc_if spi_vif(clk_i,reset_i);

  //instanciar el DUT

  spi_ip dut (
      .clk_i          (),  //Reloj de entrada
      .reset_i        (),  // reset Asincrono
      .din_i          (),  //Datos de Entrada 8 bits
      .dvsr_i         (),  //Determinara el ciclo de sclk_o. 
      .start_i        (),  //bandera de iniciar
      .cpol_i         (),  //Polaridad del reloj
      .cpha_i         (),  //Fase del reloj. (Cphol y Cpha me definen el modo de slck)
      .dout_o         (),  //
      .spi_done_tick_o(),  //Bandera de fin
      .ready_o        (),  //Bandera Para transmitir
      .sclk_o         (),  //Reloj para la transmision de datos
      .miso_i         (),  //
      .mosi_o         ()
  );
  /*
spi_ip dut(
     .clk_i             (spi_vif.clk_i),            //Reloj de entrada
     .reset_i           (spi_vif.reset_i),          // reset Asincrono
     .din_i             (spi_vif.din_i),            //Datos de Entrada 8 bits
     .dvsr_i            ('d50),          //Determinara el ciclo de sclk_o. 
     .start_i           (spi_vif.start_i),          //bandera de iniciar
     .cpol_i            (1'b0),           //Polaridad del reloj
     .cpha_i            (1'b0),           //Fase del reloj. (Cphol y Cpha me definen el modo de slck)
     .dout_o            (spi_vif.dout_o),           //
     .spi_done_tick_o   (spi_vif.spi_done_tick_o),//Bandera de fin
     .ready_o           (spi_vif.ready_o),           //Bandera Para transmitir
     .sclk_o            (spi_vif.sclk_o),           //Reloj para la transmision de datos
     .miso_i            (1'b0),           //
     .mosi_o            (spi_vif.mosi_o)  
);

*/
  initial begin
    $timeformat(-9, 0, " ns", 10);
    //vas a pasar un tipo virtual y ponemos set para guardarlo adentro y despues decimos uvm_test_top 
    //vamos a llamar una función que se llama uvm.config y necesita un tipo de mi interfaz, despues pongo set porque se va a guardar ahí, y le damos aun path, test, env, y agent, y todo lo que este en agent puedes utilizarlo
    //  uvm_config_db#(virtual spi_uvc_if)::set(null, "uvm_test_top.m_env.m_spi_agent", "vif", spi_vif); //path,elmento "vif", nombre del archivo interfaz, acceder a la interfaz virtual
    run_test();
  end

endmodule : tb
