module CPU(
    input  logic       Clock,   
    input  logic       Reset,   
    output logic [5:0] Reg_d,   
    output logic [2:0] Estado   
);

    logic [5:0]  fio_pc_para_memoria;   
    logic [19:0] fio_instrucao;         
    logic        fio_ctrl_pc;      
    logic        fio_ctrl_memoria; 
    logic        fio_ctrl_ula;     
    logic [4:0]  fio_reg1_ula;     
    logic [4:0]  fio_reg2_ula;     
    logic [5:0]  fio_ula_banco;    

    pc instancia_pc (
        .Clock(Clock),
        .Reset(Reset),
        .Sinal_Controle_CPU(fio_ctrl_pc),
        .Contador(fio_pc_para_memoria)
    );

    Memoria_instrucoes instancia_memoria (
        .Clock(Clock),
        .Reset(Reset),
        .Contador(fio_pc_para_memoria),
        .Sinal_CPU({4'b0000, fio_ctrl_memoria}), 
        .Instrucao(fio_instrucao)
    );

    Banco_Registradores instancia_banco (
        .Clock(Clock),
        .Reset(Reset),
        .Conteudo_R1(fio_instrucao[14:10]), 
        .Conteudo_R2(fio_instrucao[9:5]),   
        .Resultado_ULA(fio_ula_banco),
        .Reg_1(fio_reg1_ula),
        .Reg_2(fio_reg2_ula),
        .Reg_d(Reg_d)                       
    );

    ULA instancia_ula (
        .Clock(Clock),
        .Opcode(fio_instrucao[19:15]),      
        .Sinal_CPU(fio_ctrl_ula),
        .Reg_1(fio_reg1_ula),
        .Reg_2(fio_reg2_ula),
        .Resultado(fio_ula_banco)
    );

    unidade_controle instancia_controle (
        .Clock(Clock),
        .Reset(Reset),
        .Sinal_PC(fio_ctrl_pc),
        .Sinal_Memoria(fio_ctrl_memoria),
        .Sinal_ULA(fio_ctrl_ula),
        .Estado(Estado)                     
    );

endmodule