`timescale 1ns/1ps

module alu_tb;

    reg [3:0] A, B;
    reg [2:0] opcode;
    wire [3:0] result;

    alu uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, alu_tb);

        A = 4'd10; B = 4'd3;

        opcode = 3'b000; #10;
        $display("ADD: A=%d B=%d Result=%d", A, B, result);

        opcode = 3'b001; #10;
        $display("SUB: A=%d B=%d Result=%d", A, B, result);

        opcode = 3'b010; #10;
        $display("AND: A=%d B=%d Result=%d", A, B, result);

        opcode = 3'b011; #10;
        $display("OR:  A=%d B=%d Result=%d", A, B, result);

        opcode = 3'b100; #10;
        $display("XOR: A=%d B=%d Result=%d", A, B, result);

        $finish;
    end

endmodule