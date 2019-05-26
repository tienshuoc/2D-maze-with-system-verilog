module MS(
	rst_n , 
	clk , 
	maze ,
	in_valid ,
	out_valid,
	maze_not_valid,
	out_x, 
	out_y
);

input rst_n, clk, maze ,in_valid ;
output reg out_valid;
output reg maze_not_valid;
output reg [3:0]out_x, out_y ;

logic out_valid_ns;
logic maze_not_valid_ns;
logic [3:0] out_x_ns, out_y_ns ;

// [x][y] or [y][x] ?
logic map [0:14][0:14];
logic map_ns [0:14][0:14];

logic [7:0] counter_in;
logic [7:0] counter_in_ns;

// reset -> waiting for input -> input -> begin to find 
// if found -> go back and output the path at same time
// if not found -> 
parameter IDLE = 2'd0;
parameter FIND = 2'd1;
parameter BACK = 2'd2;
parameter DEAD = 2'd3;

logic [1:0] now;
logic [1:0] next;

always_ff @( posedge clk or negedge rst_n ) begin
	if (!rst_n) begin
		now <= IDLE;
		map <= 0;
		out_valid <= 0;
		maze_not_valid <= 0;
		out_x <= 0;
		out_y <= 0;
		counter_in <= 0;
	end else begin
		now <= next;
		map <= map_ns;
		out_valid <= out_valid_ns;
		maze_not_valid <= maze_not_valid_ns;
		out_x <= out_x_ns;
		out_y <= out_y_ns;
	end
end

always_comb begin
	next = now;
	case(now)
		IDLE:begin
			// input done -> find
			if (counter_in == 8'd224)
				next = FIND;
		end
 		FIND:begin
			if (conditions) begin
				
			end
		 end;
 		BACK:begin
			if (conditions) begin

			end
		 end;
 		DEAD:begin
			if (conditions) begin
				
			end
		 end;
		default:
	endcase
	out_valid_ns = now == BACK;
	maze_not_valid_ns = now == DEAD;
	out_x_ns = ;
	out_y_ns = ;
	map_ns = map;
	if(in_valid) begin
		counter_in_ns = counter_in + 1;
		map_ns[14][0:14] = {map[14][1:14], maze};
		map_ns[13][0:14] = {map[13][1:14], map[14:0]};
		map_ns[12][0:14] = {map[12][1:14], map[13:0]};
		map_ns[11][0:14] = {map[11][1:14], map[12:0]};
		map_ns[10][0:14] = {map[10][1:14], map[11:0]};
		map_ns[9][0:14] = {map[9][1:14], map[10:0]};
		map_ns[8][0:14] = {map[8][1:14], map[9:0]};
		map_ns[7][0:14] = {map[7][1:14], map[8:0]};
		map_ns[6][0:14] = {map[6][1:14], map[7:0]};
		map_ns[5][0:14] = {map[5][1:14], map[6:0]};
		map_ns[4][0:14] = {map[4][1:14], map[5:0]};
		map_ns[3][0:14] = {map[3][1:14], map[4:0]};
		map_ns[2][0:14] = {map[2][1:14], map[3:0]};
		map_ns[1][0:14] = {map[1][1:14], map[2:0]};
		map_ns[0][0:14] = {map[0][1:14], map[1:0]};
	end
end









logic [3:0] queue_bfs_x[0:12];
logic [3:0] queue_bfs_y[0:12];
logic [3:0] position_x;// current position x
logic [3:0] position_y;// current position y
logic [3:0] counter_queue;// queue index
// position <= queue
if (position == 8'b11011101) begin
	//found
end
end
//up -> left -> down -> right
if (!map[position_x][position_y]) begin
	// position + ? => queue
end
if (!map[position_x][position_y]) begin
	// position + ? => queue
end
if (!map[position_x][position_y]) begin
	// position + ? => queue
end
if (!map[position_x][position_y]) begin
	// position + ? => queue
end
if (counter_queue == 4'd0) begin
	// queue empty => dead	
end

endmodule