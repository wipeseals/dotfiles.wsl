module counter(
    input wire clk,
    input wire rst,
    output wire [3:0] count
);

    reg [3:0] count_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count_reg <= 4'b0;
        end else begin
            count_reg <= count_reg + 1;
        end
    end

    assign count = count_reg;

endmodule