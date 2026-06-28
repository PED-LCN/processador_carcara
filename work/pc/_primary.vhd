library verilog;
use verilog.vl_types.all;
entity pc is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        Sinal_Controle_CPU: in     vl_logic;
        Contador        : out    vl_logic_vector(5 downto 0)
    );
end pc;
