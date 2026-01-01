module ID_IX(clk, reset, stall, 

            PC_ID, PC_IX

            ReadData1_ID, ReadData1_IX,
            ReadData2_ID, ReadData2_IX, 

            sximm5_ID, sximm5_IX,
            sximm8_ID, sximm8_IX, 

            Rd_NUM_ID, Rd_NUM_IX
            Rn_NUM_ID, Rn_NUM_IX, 
            Rm_NUM_ID, Rm_NUM_IX, 
            
            opCode_ID, opCode_IX, 
            op_ID, op_IX, 

            ALU_op_ID, ALU_op_IX,

            shift_ID, shift_IX, 
            cond_ID, cond_IX
            ); 

    parameter N_SIZE = 16; 
    parameter N_REGISTER = 8; 
    parameter N_PC = 9;
    parameter N_NUMBERS = $clog2(N_REGISTER); 

    input logic clk; 
    input logic reset; 
    input logic stall; 

    input logic [N_PC-1:0] PC_ID; 
    output logic [N_PC-1:0] PC_IX;

    input logic [N_SIZE-1:0] ReadData1_ID; 
    output logic [N_SIZE-1:0] ReadData1_IX; 

    input logic [N_SIZE-1:0] ReadData2_ID; 
    output logic [N_SIZE-1:0] ReadData2_IX; 

    input logic [N_SIZE-1:0] sximm5_ID;
    output logic [N_SIZE-1:0] sximm5_IX;

    input logic [N_SIZE-1:0] sximm8_ID;
    output logic [N_SIZE-1:0] sximm8_IX;
    
    input logic [N_NUMBERS-1:0] Rd_NUM_ID; 
    output logic [N_NUMBERS-1:0] Rd_NUM_IX; 

    input logic [N_NUMBERS-1:0] Rn_NUM_ID; 
    output logic [N_NUMBERS-1:0] Rn_NUM_IX;
    
    input logic [N_NUMBERS-1:0] Rm_NUM_ID; 
    output logic [N_NUMBERS-1:0] Rm_NUM_IX; 

    input logic [2:0] opCode_ID; 
    output logic [2:0] opCode_IX; 

    input logic [2:0] cond_ID; 
    output logic [2:0] cond_IX; 

    input logic [1:0] op_ID; 
    output logic [1:0] op_IX; 

    input logic [1:0] ALU_op_ID; 
    output logic [1:0] ALU_op_IX;

    input logic [1:0] shift_ID; 
    output logic [1:0] shift_IX;

    always_ff @(posedge clk) begin
        if(reset) begin
            PC_IX <= '0; 
            ReadData1_IX <= '0; 
            ReadData2_IX <= '0; 
            sximm5_IX <= '0; 
            sximm8_IX <= '0; 
            Rd_NUM_IX <= '0; 
            Rn_NUM_IX <= '0; 
            Rm_NUM_IX <= '0; 
            opCode_IX <= '0; 
            cond_IX <= '0; 
            op_IX <= '0; 
            ALU_op_IX <= '0;
            shift_IX <= '0; 
        end else if(stall) begin
            PC_IX <= PC_IX; 
            ReadData1_IX <= ReadData1_IX; 
            ReadData2_IX <= ReadData2_IX; 
            sximm5_IX <= sximm5_IX; 
            sximm8_IX <= sximm8_IX; 
            Rd_NUM_IX <= Rd_NUM_IX; 
            Rn_NUM_IX <= Rn_NUM_IX; 
            Rm_NUM_IX <= Rm_NUM_IX; 
            opCode_IX <= opCode_IX; 
            cond_IX <= cond_IX; 
            op_IX <= op_IX; 
            ALU_op_IX <= ALU_op_IX;
            shift_IX <= shift_IX; 
        end else begin
            PC_IX <= PC_ID; 
            ReadData1_IX <= ReadData1_ID; 
            ReadData2_IX <= ReadData2_ID; 
            sximm5_IX <= sximm5_ID; 
            sximm8_IX <= sximm8_ID; 
            Rd_NUM_IX <= Rd_NUM_ID; 
            Rn_NUM_IX <= Rn_NUM_ID; 
            Rm_NUM_IX <= Rm_NUM_ID; 
            opCode_IX <= opCode_ID; 
            cond_IX <= cond_ID; 
            op_IX <= op_ID; 
            ALU_op_IX <= ALU_op_ID;
            shift_IX <= shift_ID; 
        end
    end
endmodule : ID_IX