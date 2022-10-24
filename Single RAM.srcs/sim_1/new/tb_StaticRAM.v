`timescale 1ns / 1ps

module tb_StaticRAM();

    reg i_clk = 0;
    reg i_ce;
    // reg i_we;
    reg i_rw;
    reg [5:0] i_addr;
    wire [7:0] io_data;
    // wire [7:0] o_data;
    reg [7:0] i_data;

    assign io_data = (i_rw == 0) ? i_data : 8'hz; 

    // SingleRAM dut(
    //     .i_clk(i_clk),
    //     .i_ce(i_ce),
    //     .i_we(i_we),
    //     .i_addr(i_addr),
    //     .i_data(i_data),
    //     .o_data(o_data)
    // );

    StaticRAM dut1(
        .i_clk(i_clk),
        .i_ce(i_ce),
        .i_rw(i_rw),
        .i_addr(i_addr),
        .io_data(io_data)
    );

    always #5 i_clk = ~i_clk;

    initial begin
        //�ʱ�ȭ
        i_clk = 0;
        i_ce = 0;
        i_rw = 0;
        i_addr = 0;
        i_data = 8'bzzzzzzzz;

        // #20 i_ce = 1; i_we = 1; i_addr = 0; i_data = 0;
        // #20 i_ce = 1; i_we = 1; i_addr = 1; i_data = 10;
        // #20 i_ce = 1; i_we = 1; i_addr = 2; i_data = 20;
        // #20 i_ce = 1; i_we = 1; i_addr = 3; i_data = 30;
        // #20 i_ce = 1; i_we = 1; i_addr = 4; i_data = 40;
        // #20 i_ce = 1; i_we = 1; i_addr = 5; i_data = 50;
        // #20 i_ce = 1; i_we = 1; i_addr = 10; i_data = 100;
        // #20 i_ce = 1; i_we = 1; i_addr = 20; i_data = 200;
        // #20 i_ce = 1; i_we = 1; i_addr = 25; i_data = 250;
        
        #20 i_ce = 1; i_rw = 0; 

        for (integer i = 0; i<64; i=i+1) begin
            #20 i_addr = i; i_data = i + 1;
        end

        #20 i_rw = 1;

        for(integer i = 0; i<64; i = i+1) begin
            #20 i_addr = i; 
        end
        
        #20 $finish;
    end
endmodule
