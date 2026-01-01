module RegFile(data_in, R_writeNum, write_flag, //write values, write bypassing as well
               Rn_NUM, Rm_NUM, Rd_NUM, //numbers for the register reads non floating point 
               Rn, Rm, Rd, //output values of the registers non floating point 
               clk, reset);
    
    parameter N_REGISTER = 8; 
    parameter N_NUMBERS = $clog2(N_REGISTER);

    parameter N_SIZE = 16; 

    input logic clk;
    input logic reset; 

    //Data to write with the write flag
    input logic [N_SIZE-1:0] data_in; 
    input logic [N_NUMBERS-1:0] R_writeNum; 
    input logic write_flag; 

    //The register numbers to read values from if needs be
    input logic [N_NUMBERS-1:0] Rn_NUM, 
    input logic [N_NUMBERS-1:0] Rm_NUM;
    input logic [N_NUMBERS-1:0] Rd_NUM; 

    //Values that are read by the register numbers. 
    output logic [N_SIZE-1:0] Rn;
    output logic [N_SIZE-1:0] Rm; 
    output logic [N_SIZE-1:0] Rd; 

    //actual registers
    logic [N_SIZE-1:0] R [N_NUMBERS-1:0]; 
    integer i; 

    always_ff @(posedge clk) begin
        if(reset) begin
            for(i = 0; i < N_NUMBERS; i = i + 1) begin
                R[i] <= '0; 
            end
        end else begin
            //Write the value to memeory 
            R[R_writeNum] <= write_flag ? data_in : R[R_writeNum]; 
        end
    end

    always_comb begin
        //read with write bypassing 
        Rn = (Rn_NUM == R_writeNum) & write_flag ? data_in : R[Rn_NUM]; 
        Rm = (Rm_NUM == R_writeNum) & write_flag ? data_in : R[Rm_NUM]; 
        Rd = (Rd_NUM == R_writeNum) & write_flag ? data_in : R[Rd_NUM];
    end
    
    
endmodule : RegFile 







