library verilog;
use verilog.vl_types.all;
entity CPU is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        Reg_d           : out    vl_logic_vector(5 downto 0);
        Estado          : out    vl_logic_vector(2 downto 0)
    );
end CPU;
