library verilog;
use verilog.vl_types.all;
entity unidade_controle is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        Sinal_PC        : out    vl_logic;
        Sinal_Memoria   : out    vl_logic;
        Sinal_ULA       : out    vl_logic;
        Estado          : out    vl_logic_vector(2 downto 0)
    );
end unidade_controle;
