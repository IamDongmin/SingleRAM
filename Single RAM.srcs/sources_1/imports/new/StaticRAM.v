`timescale 1ns / 1ps


/*
in/out�� �� ��Ʈ�� �Ǿ� �ִ� RAM
*/
module StaticRAM(
    input i_clk,
    input i_ce,
    input i_rw,         //read == 1 / write == 0
    input [5:0] i_addr,
    inout [7:0] io_data
);

    reg [7:0] mem[0:63];        // memory ����
    reg [5:0] r_addr;           // �ּ� ���� ��ŭ ��Ʈ ����

    assign io_data = (i_rw == 1) ? mem[r_addr] : 8'hz;        //highimpedance

    always @(posedge i_clk) begin
        if(i_ce) begin
            if(!i_rw) begin      //write
                mem[i_addr] <= io_data;
            end
            else begin
                r_addr <= i_addr;
            end
        end
        else begin       
        end
    end
endmodule
