module I_Decoder(instruction, opCode, op, ALU_op, sximm5, sximm8, shift, Rd, Rn, Rm, cond); 
    parameter N_INSTR = 16; 
    parameter N_SIZE = 16; 
    parameter N_REGISTER = 8; 
    parameter N_NUMBERS = $clog2(N_REGISTER); 

    input logic [N_INSTR-1:0] instruction; 

    output logic [N_SIZE-1:0] sximm5;
    output logic [N_SIZE-1:0] sximm8; 

    output logic [N_REGISTER-1:0] Rd; 
    output logic [N_REGISTER-1:0] Rn; 
    output logic [N_REGISTER-1:0] Rm; 

    output logic [2:0] opCode; 
    output logic [2:0] cond; 

    output logic [1:0] op; 
    output logic [1:0] ALU_op;
    output logic [1:0] shift; 

    assign Rd = ({instructionReg[15:13], instructionReg[12:11]} == 5'b11010 || {instructionReg[15:13], instructionReg[12:11]} == 5'b01011) ? instructionReg[10:8] : instructionReg[7:5];
    assign Rn = instructionReg[10:8];
    assign Rm = instructionReg[2:0];

    assign cond = instructionReg[10:8];
    assign opCode = instructionReg[15:13];
    assign op = instructionReg[12:11];

    assign ALU_op = instructionReg[12:11];
    assign shift = {instructionReg[15:13]} == 3'b100 ? 2'b00 : instructionReg[4:3];

    assign sximm5 = {{11{instructionReg[4]}}, instructionReg[4:0]};
    assign sximm8 = {{8{instructionReg[7]}}, instructionReg[7:0]};

endmodule : I_Decoder 

