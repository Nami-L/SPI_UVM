//include headers 
`ifndef SPI_UVC_IF_SV
`define SPI_UVC_IF_SV
//incluir las librerias de UVM, porque no sabemos que es lo priimero ques e compila

interface spi_uvc_if (
    input logic clk_i,
    input logic reset_i

); 

//SPI signals
     logic [7:0] din_i;  //Datos de Entrada 8 bits
     logic start_i;  //bandera de iniciar
     logic [7:0] dout_o;  //
     logic spi_done_tick_o;  //Bandera de fin
     logic ready_o;  //Bandera Para transmitir
     logic sclk_o;  //Reloj para la transmision de datos
     logic mosi_o;  //Salida de datos.

    //El bloque cb_drv es usado por un driver, y su tarea es manejar el DUT (Device Under Test), es decir, enviarle estímulos:


     clocking cb_drv @(posedge clk_i);
     default output #5ns;
     output din_i;
     output start_i;
     endclocking
//El bloque cb_mon es usado por el monitor, y su función es leer el comportamiento del DUT para verificar si se comporta correctamente:
     clocking cb_mon @(posedge clk_i);
     default input #1ns;
     input dout_o;  //
     input spi_done_tick_o;  //Bandera de fin
     input ready_o;  //Bandera Para transmitir
     input sclk_o; //Reloj para la transmision de datos
     input mosi_o; //Salida de datos.
     endclocking:cb_mon

endinterface: spi_uvc_if
`endif // SPI_UVC_IF_SV
