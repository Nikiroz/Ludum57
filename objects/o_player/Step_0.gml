var left = keyboard_check(ord(leftKey));
var right = keyboard_check(ord(rightKey));
var jump = keyboard_check_pressed(jumpKey);
 
var horsp = (right - left) * mcr_playerSpeed;

if(jump){
	vsp  = mcr_playerJumpForce;
}
vsp += mcr_gravity;
vsp = clamp(vsp, mcr_maxGravity);

move_and_collide(horsp, vsp, o_collision, 4, 0, 0, mcr_playerSpeed);