//ESTE ARCHIVO ES PARA HACER EL CODIGO MAS LEGIBLE
//ES DEFINIR UN TIPO DE DATO EN UN ENUMERATE EN LUGAR DE ESCRIBIR 0 O 1, SE ESCRIBE UN TIPO DE DATOS
//MAS LEGIBLE

//SE LES LLAMA POR EL NOMBRE Y NO CON 0 U 1. 
//PUEDO CREAR MIS PROPIOS TIPOS,
`ifndef SPI_UVC_TYPES_SV
`define SPI_UVC_TYPES_SV

typedef enum  { 
    SPI_UVC_WRITE,
    SPI_UVC_READ 

} spi_uvc_cmd_e;


`endif // SPI_UVC_TYPES_SV
