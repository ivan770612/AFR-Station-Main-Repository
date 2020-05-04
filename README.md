# AFR Station Source Code
![Build](https://github.com/pythsource/AFR-Station-Main-Repository/workflows/Build/badge.svg)
* **Code:** https://github.com/pythsource/AFR-Station-Main-Repository
* **Wiki:** https://tgstation13.org/wiki/Main_Page
* **AFR Station Discord:** https://discord.gg/RGJhnge
## INSTALLATION

First-time installation should be fairly straightforward. First, you'll need
BYOND installed. You can get it from https://www.byond.com/download. Once you've done
that, extract the game files to wherever you want to keep them. This is a
sourcecode-only release, so the next step is to compile the server files.
Open station.dme by double-clicking it, open the Build menu, and click
compile. This'll take a little while, and if everything's done right you'll get
a message like this:

```
saving afrstation.dmb (DEBUG mode)
afrstation.dmb - 0 errors, 0 warnings
```

If you see any errors or warnings, something has gone wrong - possibly a corrupt
download or the files extracted wrong.


Once that's done, open up the config folder. You'll want to edit config.txt to
set the probabilities for different gamemodes in Secret and to set your server
location so that all your players don't get disconnected at the end of each
round. It's recommended you don't turn on the gamemodes with probability 0,
except Extended, as they have various issues and aren't currently being tested,
so they may have unknown and bizarre bugs. Extended is essentially no mode, and
isn't in the Secret rotation by default as it's just not very fun.

You'll also want to edit config/admins.txt to remove the default admins and add
your own. "Hosting Provider" is the highest level of access, and probably the one
you'll want to use for now. You can set up your own ranks and find out more in
config/admin_ranks.txt

The format is

```
byondkey = Rank
```

where the admin rank must be properly capitalised.

This codebase also depends on a native library called rust-g. A precompiled
Windows DLL is included in this repository, but Linux users will need to build
and install it themselves. Directions can be found at the [rust-g
repo](https://github.com/tgstation/rust-g).

Finally, to start the server, run Dream Daemon and enter the path to your
compiled station.dmb file. Make sure to set the port to the one you
specified in the config.txt, and set the Security box to 'Safe'. Then press GO
and the server should start up and be ready to join. It is also recommended that
you set up the SQL backend (see below).

## UPDATING

To update an existing installation, first back up your /config and /data folders
as these store your server configuration, player preferences and banlist.

Then, extract the new files (preferably into a clean directory, but updating in
place should work fine), copy your /config and /data folders back into the new
install, overwriting when prompted except if we've specified otherwise, and
recompile the game.  Once you start the server up again, you should be running
the new version.

## HOSTING

If you'd like a more robust server hosting option.
Check out server tools suite at
https://github.com/tgstation/tgstation-server

## MAPS

AFR Station currently comes equipped with these maps.

* [DeltaStation](https://wiki.beestation13.com/view/DeltaStation)
* [BoxStation](https://wiki.beestation13.com/view/Boxstation)
* [MetaStation](https://wiki.beestation13.com/view/MetaStation)
* [PubbyStation](https://wiki.beestation13.com/view/PubbyStation)

All maps have their own code file that is in the base of the _maps directory. Maps are loaded dynamically when the game starts. Follow this guideline when adding your own map, to your fork, for easy compatibility.

The map that will be loaded for the upcoming round is determined by reading data/next_map.json, which is a copy of the json files found in the _maps tree. If this file does not exist, the default map from config/maps.txt will be loaded. Failing that, BoxStation will be loaded. If you want to set a specific map to load next round you can use the Change Map verb in game before restarting the server or copy a json from _maps to data/next_map.json before starting the server. Also, for debugging purposes, ticking a corresponding map's code file in Dream Maker will force that map to load every round.

If you are hosting a server, and want randomly picked maps to be played each round, you can enable map rotation in [config.txt](config/config.txt) and then set the maps to be picked in the [maps.txt](config/maps.txt) file.

## AWAY MISSIONS

/tg/station supports loading away missions however they are disabled by default.

Map files for away missions are located in the _maps/RandomZLevels directory. Each away mission includes it's own code definitions located in /code/modules/awaymissions/mission_code. These files must be included and compiled with the server beforehand otherwise the server will crash upon trying to load away missions that lack their code.

To enable an away mission open `config/awaymissionconfig.txt` and uncomment one of the .dmm lines by removing the #. If more than one away mission is uncommented then the away mission loader will randomly select one the enabled ones to load.

## CREDITS

- **/tg/station:** Codebase.
- **Dimon64, Ivan770612, Enardonn:** Playtesting.
- **Valve Corporation:** Weapon Sounds, VOX Announcements.
