module Banco_Registradores(
    input  logic Clock,
    input  logic Reset,
    input  logic [4:0] Conteudo_R1,
    input  logic [4:0] Conteudo_R2,   
    input  logic [5:0] Resultado_ULA, 
    output logic [4:0] Reg_1,         
    output logic [4:0] Reg_2,         
    output logic [5:0] Reg_d          
);

  always_ff @(posedge Clock) begin
        
        if (Reset == 1'b1) begin
            Reg_1 <= 5'd0;
            Reg_2 <= 5'd0;
            Reg_d <= 6'd0;
        end else begin
            Reg_1 <= Conteudo_R1;
            Reg_2 <= Conteudo_R2;
            
            Reg_d <= Resultado_ULA;
        end
     end	  
 endmodule
 