// If statement for picking up the block.
if (!picked_up){
	
	picked_up = true;
	
	// Debug message for testing.
	show_debug_message("Block added to inventory");
	
	// Removes the block from the world
	instance_destroy();
}