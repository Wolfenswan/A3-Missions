/* 
 *
 * by: harakka
 */
if (!isServer) exitWith {};

_marker = _this select 0;
_color = _this select 1;
_type = _this select 2;

// Set marker settings
_marker setMarkerType _type;
_marker setMarkerColor _color;
//_marker setMarkerText format["%1", _marker];