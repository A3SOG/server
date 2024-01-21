class CfgSounds {
    sounds[] = {};
    class SOG_timerBeep {
        name = "SOG_timerBeep";
        sound[] = {QUOTE(PATHTOF(sounds\timerClick.wav)), 1, 3};
        titles[] = {};
    };
    class SOG_timerBeepShort {
        name = "SOG_timerBeepShort";
        sound[] = {QUOTE(PATHTOF(sounds\timerClickShort.wav)), 1, 3};
        titles[] = {};
    };
    class SOG_timerEnd {
        name = "SOG_timerEnd";
        sound[] = {QUOTE(PATHTOF(sounds\timerEnd.wav)), 1, 3};
        titles[] = {};
    };
    class SOG_defused {
        name = "SOG_defused";
        sound[] = {QUOTE(PATHTOF(sounds\defused.wav)), 1, 3};
        titles[] = {};
    };
};