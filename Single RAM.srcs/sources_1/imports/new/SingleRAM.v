`timescale 1ns / 1ps

/*
64byte SingleRAM 만들기
*/
module SingleRAM(
    input i_clk,
    input i_ce,
    input i_we, //read/write
    input [5:0] i_addr,
    input [7:0] i_data,

    output [7:0] o_data
    );

    reg [7:0] mem[0:63];        // memory 선언
    reg [5:0] r_addr;           // 주소 개수 만큼 비트 선언
    //fpga를 이용한 가속기

    assign o_data = mem[r_addr];

    always @(posedge i_clk) begin
        if(i_ce) begin
            if(i_we) begin      //write
                mem[i_addr] <= i_data;
            end
            else begin
                r_addr <= i_addr;
            end
            // r_addr <= i_addr; // 지금은 이것도 가능
        end
        else begin    
        end
    end
endmodule
