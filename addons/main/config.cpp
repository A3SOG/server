#include "script_component.hpp"

// information on this addon specifically
class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common", "cba_main"};
        authors[] = {"J. Schmidt", "Creedcoder"}; // sub array of authors, considered for the specific addon
        author = "SOG"; // primary author name, either yours or your team's, considered for the whole mod
        VERSION_CONFIG;

        serverSaveLoop = 1;
        serverSaveLoopTime = 30;
        companyGenerals[] = {"76561198027566824"};
        AISkill = 0.8;
    };
};

// configs go here
#include "CfgEventHandlers.hpp"
#include "CfgMods.hpp"