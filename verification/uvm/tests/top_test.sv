//PASOS
//#1 crear un test
//#2 crear boiled
//#3 crear constructor
//#4 crear el environment
//#5 imprimir la topologia
//include header guards
// para definir el archivo una sola vez
`ifndef TOP_TEST_SV
`define TOP_TEST_SV

class top_test extends uvm_test;
//como es componente, agregar la macro

  `uvm_component_utils(top_test)
  //instanciar el environment, declarando el objeto
    top_env m_env ;//: PARA PODER TENER ACCESO AL ENV, TENEMOS QUE AGREGARLO EN EL PACKAGE DEL TOP

//Agregar primero el constructor
extern function new(string name, uvm_component parent);
// Crear el environment
//UVM trabaja por fases, build, run phases,clenaup phases.

//en la fase de build phase, en esta fase, se instancia, crear obejetos
extern function void build_phase(uvm_phase phase);
extern function void end_of_elaboration_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);

endclass:top_test

function top_test::new(string name, uvm_component parent);
super.new(name,parent);
endfunction:new

function void top_test::build_phase(uvm_phase phase);
//Aqui creas el objeto instanciadndo similar al utilizar new()
m_env = top_env::type_id::create("m_env",this); //UNA VEZ AGREADO EL ENVIRONMENT, LO CONSTRUIOMOS
endfunction:build_phase

function void top_test::end_of_elaboration_phase(uvm_phase phase);
//imprimir uvm_root, es como imprimir la jerarquia de los bloques creados
uvm_root ::get().print_topology();
uvm_factory::get().print();
endfunction:end_of_elaboration_phase

task top_test::run_phase(uvm_phase phase);
//para activar el RUN_phase es decir, la simulación
  phase.raise_objection(this);
    `uvm_info(get_name(), "Hola Nami", UVM_MEDIUM);
    `uvm_info(get_name(), "Esto es UVM con vivado", UVM_MEDIUM);


  phase.drop_objection(this);
endtask : run_phase



`endif // TOP_TEST_SV
