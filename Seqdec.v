module sequence_detector(
    input clk,
    input rst,
    input x,
    output reg y
);

reg [2:0] state;

always @(posedge clk or posedge rst)
begin
    if(rst) begin
        state <= 0;
        y <= 0;
    end
    else begin
        case(state)
            0: state <= (x)?1:0;
            1: state <= (x)?1:2;
            2: state <= (x)?3:0;
            3: begin
                   state <= (x)?1:2;
                   y <= x;
               end
        endcase
    end
end

endmodule