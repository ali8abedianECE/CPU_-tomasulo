module Decode(instruction, //The instruction that is going to be decoded.
              write_flag, Rd_write_NUM, writeData, //write back stage pipline.
              sximm5, sximm8, //Imediate data extracted 
              Rd_i_NUM, Rn_i_NUM, Rm_i_NUM, //The register numbers for the instruction
              ReadData1, ReadData2, //Data read value

              opCode, op, ALU_op,
              shift, cond,

              clk, reset
              );
    parameter N_INSTR = 16; 
    parameter N_SIZE = 16; 
    parameter N_REGISTER = 8; 
    parameter N_NUMBERS = $clog2(N_REGISTER); 

    input logic clk; 
    input logic reset; 

    input logic [N_INSTR-1:0] instruction; 

    input logic write_flag; 
    input logic [N_NUMBERS-1:0] Rd_write_NUM; 
    input logic [N_SIZE-1:0] writeData; 

    output logic [N_SIZE-1:0] sximm5;
    output logic [N_SIZE-1:0] sximm8; 

    output logic [N_NUMBERS-1:0] Rd_i_NUM;
    output logic [N_NUMBERS-1:0] Rn_i_NUM;
    output logic [N_NUMBERS-1:0] Rm_i_NUM;

    output logic [N_SIZE-1:0] ReadData1;    
    output logic [N_SIZE-1:0] ReadData2;

    output logic [2:0] opCode; 
    output logic [2:0] cond; 

    output logic [1:0] op; 
    output logic [1:0] ALU_op;
    output logic [1:0] shift; 
 
    I_Decoder #(.N_INSTR(N_INSTR), 
                .N_SIZE(N_SIZE), 
                .N_REGISTER(N_REGISTER), 
                .N_NUMBERS(N_NUMBERS)) DEC(.instruction(instruction), 
                                           .opCode(opCode),
                                           .op(op), 
                                           .ALU_op(ALU_op), 
                                           .sximm5(sximm5), 
                                           .sximm8(sximm8), 
                                           .shift(shift), 
                                           .Rd(Rd_i_NUM), 
                                           .Rn(Rn_i_NUM), 
                                           .Rm(Rm_i_NUM), 
                                           .cond(cond));

    RegFile #(.N_REGISTER(N_REGISTER), 
              .N_NUMBERS(N_NUMBERS), 
              .N_SIZE(N_SIZE)) REG_FILE(.data_in(writeData), 
                                        .R_writeNum(Rd_write_NUM), 
                                        .write_flag(write_flag), 
                                        .Rn_NUM(Rn_i_NUM), 
                                        .Rm_NUM(Rm_i_NUM), 
                                        .Rd_NUM(Rd_i_NUM), 
                                        .Rn(ReadData1), 
                                        .Rm(ReadData2), 
                                        .Rd(),
                                        .clk(clk), 
                                        .reset(reset)); 

endmodule : Decode 
