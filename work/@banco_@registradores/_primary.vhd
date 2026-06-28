library verilog;
use verilog.vl_types.all;
entity Banco_Registradores is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        Conteudo_R1     : in     vl_logic_vector(4 downto 0);
        Conteudo_R2     : in     vl_logic_vector(4 downto 0);
        Resultado_ULA   : in     vl_logic_vector(5 downto 0);
        Reg_1           : out    vl_logic_vector(4 downto 0);
        Reg_2           : out    vl_logic_vector(4 downto 0);
        Reg_d           : out    vl_logic_vector(5 downto 0)
    );
end Banco_Registradores;
