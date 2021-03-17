// Super Blue Boy Planet Autosplitter by rythin.
// Original script by eddiesaurus87.

// Contanct info in case issues arise:
// Discord: rythin#0135
// Twitter: rythin_sr
// Twitch:  rythin_sr

state("006", "1.2") {
	int levelID: 0x5CB860;
}

state("006", "1.1") {
	int levelID: 0x59D310;
}

state("Super Blue Boy Planet", "1.1") { // Itch.io version
	int levelID: 0x59D310;
}

state("Super Blue Boy Planet", "2.0") {
	int levelID: 0x6C2D90;
}

init {
	switch (modules.First().ModuleMemorySize) {
		case 16973824: case 6225920: version = "1.1"; break;
		case 6311936: version = "1.2"; break;
		case 7393280: version = "2.0"; break;
		default: version = "Undetected!"; break;
	}

	vars.storedLevel = 0;
}

start {
	if (old.levelID == 0 && current.levelID == 1) {
		vars.storedLevel = 0;
		return true;
	}
}

split {
	if (old.levelID > vars.storedLevel && current.levelID == 0) {
		vars.storedLevel = old.levelID;
		return true;
	}
}

reset {
	return old.levelID == 0 && current.levelID == 1;
}
