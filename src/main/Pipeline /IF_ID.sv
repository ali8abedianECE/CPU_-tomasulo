module IF_ID(instruction_FETCH, PC_FETCH, 
             instruction_DECODE, PC_DECODE, 
             clk, reset, stall); 

    parameter N_INSTR = 16; 
    parameter N_PC = 9;

    input logic clk; 
    input logic reset; 
    input logic stall; 

    input logic [N_INSTR-1:0] instruction_FETCH; 
    input logic [N_PC-1:0] PC_FETCH; 

    output logic [N_INSTR-1:0] instruction_DECODE;
    output logic [N_PC-1:0] PC_DECODE; 

    always_ff @(posedge clk) begin
        if(reset) begin
            instruction_DECODE <= '0; 
            PC_DECODE <= '0; 
        end else if(stall) begin
            instruction_DECODE <= instruction_DECODE; 
            PC_DECODE <= PC_DECODE; 
        end else begin
            instruction_DECODE <= instruction_FETCH; 
            PC_DECODE <= PC_FETCH;
        end
    end
    
endmodule : IF_ID

    
