function print() {
	static _buffer = buffer_create(512, buffer_grow, 1)
	
	var _index = 1
	
	buffer_seek(_buffer, buffer_seek_start, 0)
	buffer_write(_buffer, buffer_text, string(argument[0]))
	
	repeat (argument_count - 1) {
		buffer_write(_buffer, buffer_text, " ")
		buffer_write(_buffer, buffer_text, string(argument[_index ++]))
	}
	
    buffer_write(_buffer, buffer_u8, 0)
	
	buffer_seek(_buffer, buffer_seek_start, 0)
	show_debug_message(buffer_read(_buffer, buffer_text))
}