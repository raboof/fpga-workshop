
module chip (
	output	LED_R,
	output	LED_G,
	output	LED_B,
  input   INPUT_1
	);

	wire clk, led_r, led_g, led_b, reset;

	SB_HFOSC u_hfosc (
        	.CLKHFPU(1'b1),
        	.CLKHFEN(1'b1),
        	.CLKHF(clk)
    	);

  // RED
	top red_top (
		.clk(clk),
		.rst(reset),
    .speed(1301),
    		.led(led_r),
	);

  // GREEN
	top green_top (
		.clk(clk),
		.rst(reset),
    .speed(1607),
    		.led(led_g),
	);

  // BLUE
	top blue_top (
		.clk(clk),
		.rst(reset),
    .speed(1999),
    		.led(led_b),
	);

	assign LED_R = led_r;
	assign LED_G = led_g;
	assign LED_B = led_b;

  assign reset = INPUT_1;

endmodule
