`timescale 1ns/1ps

module cpu_tb;

    // 1. Declaração de sinais do teste
    logic       clk;
    logic       rst;
    logic [5:0] reg_d_saida;
    logic [2:0] estado_atual;

    // 2. Instanciação do processador completo (Top-Level)
    CPU meu_processador (
        .Clock(clk),
        .Reset(rst),
        .Reg_d(reg_d_saida),
        .Estado(estado_atual)
    );

    // 3. Geração do sinal de Clock (Período de 20ns - 50MHz)
    always begin
        #10 clk = ~clk;
    end

    // 4. Fluxo do Teste
    initial begin
        // Inicialização dos sinais
        clk = 0;
        rst = 1; // Ativa o reset no início para limpar o sistema
        
        #25;
        rst = 0; // Desativa o reset para o processador começar a rodar
        
        // Deixa a simulação rodar por tempo suficiente para executar o programa completo
        // Cada instrução leva cerca de 5 ciclos de clock. 5 instruções * 5 ciclos * 20ns = 500ns.
        #600;
        
        $display("Simulação concluída com sucesso!");
        $stop; // Pausa a simulação no ModelSim/Questa
    end

endmodule