`timescale 1ns/1ps

module tb_nd;
    reg clk;
    reg rest;
    reg sensor1;
    reg sensor2;
    wire switch1;
    wire switch2;

    nd uut (
        .clk(clk),
        .rest(rest),
        .sensor1(sensor1),
        .sensor2(sensor2),
        .switch1(switch1),
        .switch2(switch2)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rest = 1; sensor1 = 0; sensor2 = 0;
        #10 rest = 0;
        #10 sensor1 = 1; sensor2 = 0;
        #10 sensor1 = 0; sensor2 = 1;
        #10 sensor1 = 0; sensor2 = 0;
        #10 $stop;
    end
endmodule
