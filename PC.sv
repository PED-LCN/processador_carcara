module pc (
    input  logic       Clock,              
    input  logic       Reset,              
    input  logic       Sinal_Controle_CPU, 
    output logic [5:0] Contador            
);

    always_ff @(posedge Clock) begin
        if (Reset) begin
            Contador <= 6'b000000; 
        end
        else if (Sinal_Controle_CPU) begin
  
            if (Contador == 6'd4) begin
                Contador <= 6'd0;
            end else begin
                Contador <= Contador + 1'b1; 
            end
        end
    end

endmodule

