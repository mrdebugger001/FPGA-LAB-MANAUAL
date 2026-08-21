`timescale 1ns/1ps

module priority_encoder_4to2 (
    input  wire I3,
    input  wire I2,
    input  wire I1,
    input  wire I0,
    output wire Y1,
    output wire Y0,
    output wire valid
);

assign Y1    = I3 | ((~I3) & I2);
assign Y0    = I3 | ((~I3) & (~I2) & I1);
assign valid = I3 | I2 | I1 | I0;

endmodule