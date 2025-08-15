module nd(
    input clk,
    input rest,
    input sensor1,
    input sensor2,
    output reg switch1,
    output reg switch2
);

always @(posedge clk) begin
    if (rest) begin
        switch1 <= 0;
        switch2 <= 0;
    end else begin
        case ({sensor1, sensor2})
            2'b00: begin
                switch1 <= 0;
                switch2 <= 0;
            end
            2'b10: begin
                switch1 <= 1;
                switch2 <= 0;
            end
            2'b01: begin
                switch1 <= 0;
                switch2 <= 1;
            end
        endcase
    end
end

endmodule
