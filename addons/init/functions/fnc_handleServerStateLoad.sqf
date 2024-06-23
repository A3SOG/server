_data = _this;

if (count _data == 0) exitwith {
    companyGenerals = (configFile >> "CfgPatches" >> "sog_server_main" >> "companyGenerals") call BIS_fnc_getCfgData;
    publicVariable "companyGenerals";

    companyFunds = "OP_BUDGET" call BIS_fnc_getParamValue;
    companyRating = "OP_RATING" call BIS_fnc_getParamValue;

    // companyFunds = getNumber (missionConfigFile >> "Params" >> "OP_BUDGET" >> "default");
    publicVariable "companyFunds";
    publicVariable "companyRating";
    
    diag_log "No Server Entry Found!"
};

{
    _name = _x select 0;
    _value = _x select 1;

    switch (_name) do {
        case "companyFunds": { companyFunds = _value; publicVariable "companyFunds" };
        case "companyRating": { companyRating = _value; publicVariable "companyRating" };
        case "companyGenerals": { companyGenerals = _value; publicVariable "companyGenerals" };
    };
} forEach _data;