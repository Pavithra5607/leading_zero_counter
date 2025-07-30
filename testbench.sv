
module tb_lzc;
    reg  [7:0] in;
    wire [3:0] count;

    leading_zero_counter uut (
        .in(in),
        .count(count)
    );

    initial begin
      $dumpfile("leading_zero_counter.vcd");
      $dumpvars;
        $display("Time\tInput\t\tCount");
        $monitor("%0t\t%b\t%d", $time, in, count);

        in = 8'b00000000; #10; // Expect 8
        in = 8'b00000001; #10; // Expect 7
        in = 8'b00000010; #10; // Expect 6
        in = 8'b00000100; #10; // Expect 5
        in = 8'b00001000; #10; // Expect 4
        in = 8'b00010000; #10; // Expect 3
        in = 8'b00100000; #10; // Expect 2
        in = 8'b01000000; #10; // Expect 1
        in = 8'b10000000; #10; // Expect 0
        in = 8'b11111111; #10; // Expect 0
        in = 8'b01111111; #10; // Expect 1
        in = 8'b00111111; #10; // Expect 2
        in = 8'b00000010; #10; // Expect 6

        $finish;
    end
endmodule