module Memoria_instrucoes(
    input  logic        Clock,        
    input  logic        Reset,        
    input  logic [5:0]  Contador,     
    input  logic [4:0]  Sinal_CPU,    
    output logic [19:0] Instrucao     
);

    logic [19:0] mem [0:63];

    localparam logic [19:0] SOMA      = {5'b00001, 5'b00101, 5'b00011, 5'b00000};
    localparam logic [19:0] SUBTRACAO = {5'b00010, 5'b00101, 5'b00011, 5'b00000};
    localparam logic [19:0] MAIOR_QUE = {5'b00011, 5'b00101, 5'b00011, 5'b00000};
    localparam logic [19:0] MENOR_QUE = {5'b00100, 5'b00101, 5'b00011, 5'b00000};
    localparam logic [19:0] IGUAL     = {5'b00101, 5'b00101, 5'b00011, 5'b00000};

    integer i;

    always_ff @(posedge Clock) begin
        if (Reset) begin
            for (i = 0; i < 64; i++) begin
                mem[i] <= 20'b0;
            end
            Instrucao <= 20'b0;
        end
        else begin
            mem[0] <= SOMA;
            mem[1] <= SUBTRACAO;
            mem[2] <= MAIOR_QUE;
            mem[3] <= MENOR_QUE;
            mem[4] <= IGUAL;
				
            if (Sinal_CPU != 5'b00000) begin
                Instrucao <= mem[Contador]; 
            end 
        end
    end

endmodule
