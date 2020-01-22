#include <sourcemod>
#include <convar_class>

public void OnPluginStart()
{
	new Convar("convar_name", "default value");
	
	Convar.CreateConfig();
}