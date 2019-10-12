## Why

This is a pretty straight forward replacement for the AutoExecConfig include that many people use. For whatever reason, some plugins that use that include to generate their configs kept having their convars reset. Plugins that didn't use it weren't able to update with the new values, so here we are.

## Requirements

The compiler must be able to support enum structs which means a sourcemod 1.10 or above compiler.

## What's It Do

ConVars created with this class will have their bounds updated when the plugin loads, an issue that default convar creation has. When the CreateConfig method is called all settings stored inside the config will be stored and the config will be recreated with the new descriptions and default values. If a convar was removed from the plugin then it will be removed from the config, and as a side effect, any convars not belonging to the plugin will be removed. Since not all values can be changed or tracked after a convar is made there is an optional parameter to copy a convar enum struct with the stored values inside.

## Usage
Add `#include <convar_class>` somewhere after your sourcemod include. Replace `ConVar` with `Convar` and `CreateConVar` with `new Convar`. To create the config call the `.CreateConfig` method, the constructor supports all parameters as the CreateConVar native.

## Example
```
#include <sourcemod>
#include <convar_class>

Convar g_MyConvar;

public void OnPluginStart()
{
	g_MyConvar = new Convar("convar_name", "default value");

	Convar.CreateConfig();
}
```

## Notes

* Requires sourcemod 1.10
* CreateConfig must be called after convars are created.
* If you do not use CreateConfig then the `.Close` method must be called afterward to prevent a memory leak.
* Use the `FCVAR_DONTRECORD` flag to prevent writing the convar to a file.
* Plugins in sub-folders must declare their filename.
* Only convars and comments generated from the plugin may be put inside its config. Anything else will be erased and may result in an error.