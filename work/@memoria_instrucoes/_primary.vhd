library verilog;
use verilog.vl_types.all;
entity Memoria_instrucoes is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        Contador        : in     vl_logic_vector(5 downto 0);
        Sinal_CPU       : in     vl_logic_vector(4 downto 0);
        Instrucao       : out    vl_logic_vector(19 downto 0)
    );
end Memoria_instrucoes;
