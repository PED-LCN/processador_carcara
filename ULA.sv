module ULA(
	 input  logic Clock,     
    input  logic [4:0] Opcode,    
    input  logic Sinal_CPU, 
    input  logic [4:0] Reg_1,     
    input  logic [4:0] Reg_2,     
    output logic [5:0] Resultado  
);

always_ff @( posedge Clock) begin

	if( Sinal_CPU) begin
		case(Opcode)
			5'b00001 : Resultado <= Reg_1 + Reg_2;
			5'b00010 : Resultado <= Reg_1 - Reg_2;
			5'b00011 : Resultado <= Reg_1 > Reg_2;
			5'b00100 : Resultado <= Reg_1 < Reg_2;
			5'b00101 : Resultado <= Reg_1 == Reg_2;
			default  : Resultado <= 6'b000000;			
		endcase
	end
end 

endmodule
