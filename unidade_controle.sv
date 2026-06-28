module unidade_controle (
    input  logic       Clock,
    input  logic       Reset,
    output logic       Sinal_PC,      
    output logic       Sinal_Memoria, 
    output logic       Sinal_ULA,     
    output logic [2:0] Estado         
);     

    typedef enum logic [2:0] {
        S0, 
        ativaMemoria, 
        esperaDados, 
        ativaULA, 
        incrementaPC
    } state_t;

    state_t current, next;

    always_ff @(posedge Clock) begin
        if (Reset)
            current <= S0;
        else
            current <= next;
    end
    
    always_comb begin
        case (current)
            S0:           next = ativaMemoria;
            ativaMemoria: next = esperaDados;
            esperaDados:  next = ativaULA;
            ativaULA:     next = incrementaPC;
            incrementaPC: next = ativaMemoria; 
            default:      next = S0;
        endcase
    end
     
    always_comb begin
        Sinal_PC      = 1'b0;
        Sinal_Memoria = 1'b0;
        Sinal_ULA     = 1'b0;
        Estado        = current; 

        case (current)
            S0: begin
            end
            
            ativaMemoria: begin
                Sinal_Memoria = 1'b1; 
            end
            
            esperaDados: begin
            end
            
            ativaULA: begin
                Sinal_ULA = 1'b1; 
            end
            
            incrementaPC: begin
                Sinal_PC = 1'b1; 
            end
            
            default: begin
            end
        endcase
    end

endmodule