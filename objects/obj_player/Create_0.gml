spd = 1;
grav = 0.1;
global.gravdir = "down";
global.jump = 3;
slamming = false;
dir = "right";
right = false;
left = false;
up = false;
down = false;

//Block checks
inblock = false;
blockbelow = false;
blockabove = false;
blockright = false;
blockleft = false;

//Switch checks
gswitchbelow = false;
gswitchabove = false;
spdswitchabove = false;
spdswitchbelow = false;
jumpswitchabove = false;
jumpswitchbelow = false;
blockswitchabove = false;
blockswitchbelow = false;
fireswitchabove = false;
fireswitchbelow = false;

//Set starting position
x = global.spawnx;
y = global.spawny;