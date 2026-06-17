module tb;

reg clk,rst,x;
wire y;

sequence_detector uut(clk,rst,x,y);

always #5 clk=~clk;

initial begin
    $dumpfile("seq.vcd");
  $dumpvars(0,tb);

    clk=0; rst=1; x=0;
    #10 rst=0;

    x=1; #10;
    x=0; #10;
    x=1; #10;
    x=1; #10;

    #20 $finish;
end

endmodule
