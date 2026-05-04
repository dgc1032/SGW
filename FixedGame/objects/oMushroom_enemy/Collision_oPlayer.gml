// Removes a life from the player on contact.
with (other) {
    if (variable_instance_exists(id, "lives")) {
        lives -= 1;
    }
}
//if (alive) {
    //other.lives -= 1;
	//show_debug_message(object_get_name(other.object_index));
//}