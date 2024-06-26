_timeout = 10;
_timeoutRange = 3;
_radius = 200;
_safeSpace = 50;

_dropChance = 30;
_lootItem = "";

_unitList = ["B_medic_F","B_soldier_AR_F","B_Soldier_F","B_Soldier_GL_F"];

while {true} do
{
	_playerPos = position player;

	_randomAngle = random 360;
	_randomDistance = random (_radius - _safeSpace) + _safeSpace;
	
	_randomX = (_playerPos select 0) + (_randomDistance * cos(_randomAngle));
	_randomY = (_playerPos select 1) + (_randomDistance * sin(_randomAngle));
	_randomPos = [_randomX, _randomY, 0];

	_unit = group player createUnit [_unitList select (round(random((count _unitList)-1))), _randomPos, [], 0, "CAN_COLLIDE"];
	if (random 1 < (_dropChance / 100)) then {
        _unit addItemToBackpack _lootItem;
    };

	sleep (round(random _timeoutRange*2) + _timeout - _timeoutRange);
};