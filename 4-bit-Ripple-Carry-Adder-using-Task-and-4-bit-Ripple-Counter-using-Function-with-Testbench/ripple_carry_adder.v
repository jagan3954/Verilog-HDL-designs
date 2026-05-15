module ripple_carry_adder_4bit ( input [3:0] A, input [3:0] B, input Cin, output [3:0] Sum, output Cout);

reg [3:0] sum_temp;
reg [3:0] cout_temp;

// Task for Full Adder
task full_adder;
    input a, b, cin;
    output Sum, Cout;
    begin
        Sum = a ^ b ^ cin;
        Cout = (a & b) | (b & cin) | (cin & a);
    end
endtask

// Ripple carry logic using task
always @(*)
begin
    full_adder(A[0], B[0], Cin, sum_temp[0], cout_temp[0]);
    full_adder(A[1], B[1], cout_temp[0], sum_temp[1], cout_temp[1]);
    full_adder(A[2], B[2], cout_temp[1], sum_temp[2], cout_temp[2]);
    full_adder(A[3], B[3], cout_temp[2], sum_temp[3], cout_temp[3]);
end

assign Sum = sum_temp;
assign Cout = cout_temp[3];
endmodule