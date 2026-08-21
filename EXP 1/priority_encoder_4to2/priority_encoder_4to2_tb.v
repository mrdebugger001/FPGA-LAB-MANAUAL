`timescale 1ns/1ps

module priority_encoder_4to2_tb;

reg I3;
reg I2;
reg I1;
reg I0;

wire Y1;
wire Y0;
wire valid;

reg expected_Y1;
reg expected_Y0;
reg expected_valid;
integer input_value;
integer pass_count;

priority_encoder_4to2 uut (
    .I3(I3),
    .I2(I2),
    .I1(I1),
    .I0(I0),
    .Y1(Y1),
    .Y0(Y0),
    .valid(valid)
);

initial begin
    $dumpfile("EXP 1/priority_encoder_4to2/priority_encoder_4to2.vcd");
    $dumpvars(0, priority_encoder_4to2_tb);

    pass_count = 0;
    $display("---------------------------------------------------------------");
    $display(" I3 I2 I1 I0 | Y1 Y0 valid | E_Y1 E_Y0 E_valid | Status");
    $display("---------------------------------------------------------------");

    for (input_value = 0; input_value < 16; input_value = input_value + 1) begin
        {I3, I2, I1, I0} = input_value[3:0];

        if (I3) begin
            expected_Y1 = 1'b1;
            expected_Y0 = 1'b1;
            expected_valid = 1'b1;
        end else if (I2) begin
            expected_Y1 = 1'b1;
            expected_Y0 = 1'b0;
            expected_valid = 1'b1;
        end else if (I1) begin
            expected_Y1 = 1'b0;
            expected_Y0 = 1'b1;
            expected_valid = 1'b1;
        end else if (I0) begin
            expected_Y1 = 1'b0;
            expected_Y0 = 1'b0;
            expected_valid = 1'b1;
        end else begin
            expected_Y1 = 1'b0;
            expected_Y0 = 1'b0;
            expected_valid = 1'b0;
        end

        #1;
        if ({Y1, Y0, valid} !== {expected_Y1, expected_Y0, expected_valid}) begin
            $display(" %b  %b  %b  %b |  %b  %b    %b   |   %b     %b      %b   | FAIL",
                     I3, I2, I1, I0, Y1, Y0, valid,
                     expected_Y1, expected_Y0, expected_valid);
            $fatal(1, "Mismatch for input %b%b%b%b", I3, I2, I1, I0);
        end

        pass_count = pass_count + 1;
        $display(" %b  %b  %b  %b |  %b  %b    %b   |   %b     %b      %b   | PASS",
                 I3, I2, I1, I0, Y1, Y0, valid,
                 expected_Y1, expected_Y0, expected_valid);
    end

    $display("---------------------------------------------------------------");
    $display("All %0d priority encoder input combinations passed.", pass_count);
    $finish;
end

endmodule