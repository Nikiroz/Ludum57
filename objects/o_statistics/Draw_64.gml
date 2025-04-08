

draw_text(300, 20, "Day " + string(global.dayNumbers));
draw_text(50, 120, "Scrap collected value: +" + string(global.scavenge) + "$");

draw_text(50, 160, "Food: -" + string(4) + "$");
draw_text(50, 180, "Oxygen: " + string(global.oxygen) + "$");
draw_text(50, 220, "Fuel: " + string(global.fuel) + "$");

draw_text(10, 280, "___________________________________");

draw_text(150, 320, "Income: " + string(income) + "$");
draw_text(270, 320, "Total Money: " + string(global.money) + "$");


