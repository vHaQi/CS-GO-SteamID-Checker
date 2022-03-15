/* [ Includes ] */
#include <sourcemod>
#include <sdktools>
#include <colors> 

/* [ Compiler Options ] */
#pragma newdecls required
#pragma semicolon 1

/* [ Defines ] */
#define PLUGIN_NAME 		"[CS:GO] HaQi - [ SteamID Checker ]"
#define PLUGIN_AUTHOR 		"HaQi"
#define PLUGIN_DESC 		"sprawdź swoje steamid, wpisując komende na czacie"
#define PLUGIN_VERSION 		"1.0"
#define PLUGIN_URL 			"https://steamcommunity.com/id/HaQi0"

/* [ Plugin Author And Informations ] */
public Plugin myinfo = {
	name = PLUGIN_NAME, 
	author = PLUGIN_AUTHOR, 
	description = PLUGIN_DESC, 
	version = PLUGIN_VERSION, 
	url = PLUGIN_URL
};

/* [ Plugin Startup ] */
public void OnPluginStart()
{
    RegConsoleCmd("sm_steamid", CommandSteamid, "");
    RegConsoleCmd("sm_sid", CommandSteamid, "");
}

/* [ Commands ] */
public Action CommandSteamid(int client, int args)
{
    char authid[32];
    GetClientAuthId(client, AuthId_Steam2, authid, sizeof(authid));
    
    /*
     * Wysyła wiadomość na chat
    */
    CPrintToChat(client, "========================================");
    CPrintToChat(client, "★ {green}Twoje SteamID to: {darkred}%s", authid);
    CPrintToChat(client, "★ {green}Wydrukowano również w konsoli.");
    CPrintToChat(client, "========================================");
    /*
     * Wysyła wiadomość w konsoli
    */
    PrintToConsole(client, "========================================");
    PrintToConsole(client, "★ Twoje SteamID to: %s", authid);
    PrintToConsole(client, "========================================");
    return Plugin_Handled;
} 