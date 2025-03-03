`timescale 1ns/1ps

module counter_tb;

    reg clk;
    reg rst;
    wire [3:0] count;

    counter counter_inst(
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    initial begin
        $dumpfile("counter_tb.vcd"); // Specify the name of the VCD file
        $dumpvars(0, counter_tb);    // Dump all variables in the testbench
        clk = 0;
        rst = 0;
        #10 rst = 1;
        #10 rst = 0;
        #100 $finish;
    end

    always begin
        #5 clk = ~clk;
    end

endmodule