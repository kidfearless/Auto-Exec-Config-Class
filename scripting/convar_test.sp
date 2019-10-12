#include <sourcemod>
#include <convar_class>

Convar g_MyConvar;

public void OnPluginStart()
{
	g_MyConvar = new Convar("convar_name", "default value");

	Convar.CreateConfig();
}