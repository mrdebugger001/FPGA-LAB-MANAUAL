module full_subtractor(
    input A,
    input B,
    input Bin,
    output Difference,
    output Borrow
);

assign Difference = A ^ B ^ Bin;

assign Borrow = ((~A) & B) | ((~A) & Bin) | (B & Bin);

endmodule