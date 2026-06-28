library verilog;
use verilog.vl_types.all;
entity ULA is
    port(
        Clock           : in     vl_logic;
        Opcode          : in     vl_logic_vector(4 downto 0);
        Sinal_CPU       : in     vl_logic;
        Reg_1           : in     vl_logic_vector(4 downto 0);
        Reg_2           : in     vl_logic_vector(4 downto 0);
        Resultado       : out    vl_logic_vector(5 downto 0)
    );
end ULA;
