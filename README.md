# Snarky Snappy codebase
<a href="https://soylent.com"><img src="https://gitgud.io/SnarkySnappySS13/ShartyStation13/-/raw/master/.gitlab/images/fueledby.png" height="35" width="148.5"></a>
<a href="https://jakparty.soy"><img src="https://gitgud.io/SnarkySnappySS13/ShartyStation13/-/raw/master/.gitlab/images/bviltwith.png" height="35" width="211.5"></a>
<a href="https://soybooru.com"><img src="https://gitgud.io/SnarkySnappySS13/ShartyStation13/-/raw/master/.gitlab/images/contains.png" height="35" width="136"></a>
[![forinfinityandbyond](https://user-images.githubusercontent.com/5211576/29499758-4efff304-85e6-11e7-8267-62919c3688a9.gif)](https://www.reddit.com/r/SS13/comments/5oplxp/what_is_the_main_problem_with_byond_as_an_engine/dclbu1a)

| Website                 | Link                                           |
|-------------------------|------------------------------------------------|
| Website                 | [https://soyjak.st/ss/](https://soyjak.st/ss/) |
| Code                    | [https://gitgud.io/SnarkySnappySS13/ShartyStation13](https://gitgud.io/SnarkySnappySS13/ShartyStation13) |
| Wiki                    | [https://wiki.soyjak.st/](https://wiki.soyjak.st/) |
| Codedocs                | [https://codedocs.tgstation13.org/](https://codedocs.tgstation13.org/) |

This is the codebase for the soicaca-flavored fork of Space Station 13. This repo is keyed off of the Monkestation codebase, this is a custom fork of that repo intended for use on our server, but feel free to host it if you'd like.

Space Station 13 is an open-source tile-based A24 slowburn autistic role-playing video game created in 2003 by Exadv1, originally supposed to be an atmospheric simulator. It is now collectively maintained by its "community" and runs on the shitty freeware game engine BYOND, made sometime in 1996. SS13 dwarfs the other shitty Dragon Ball roleplay games on BYOND by thousands of players, which would have likely died in 2014 if it were not for SS13 singlehandedly keeping the entire platform alive. 

## DOWNLOADING

[Downloading](.github/guides/DOWNLOADING.md)

[Running on the server](.github/guides/RUNNING_A_SERVER.md)

[Maps and Away Missions](.github/guides/MAPS_AND_AWAY_MISSIONS.md)

## nobody gives a single fuck about this part but im keeping it for prosperity

On **2021-01-04** we changed the way to compile the codebase.

**The quick way**. Find `bin/server.cmd` in this folder and double-click it to automatically build and host the server on port 1337.

**The long way**. Find `bin/build.cmd` in this folder, and double-click it to initiate the build. It consists of multiple steps and might take around 1-5 minutes to compile. If it closes, it means it has finished its job. You can then [setup the server](.github/guides/RUNNING_A_SERVER.md) normally by opening `tgstation.dmb` in DreamDaemon.

**Building tgstation in DreamMaker directly is now deprecated and might produce errors**, such as `'tgui.bundle.js': cannot find file`.

**[How to compile in VSCode and other build options](tools/build/README.md).**

## Contributors

[Guides for Contributors](CONTRIBUTING.md)

[/tg/station HACKMD account](https://hackmd.io/@tgstation) - Design documentation here


## LICENSE

[![license-badge](https://gitgud.io/SnarkySnappySS13/ShartyStation13/-/raw/master/.gitlab/images/soylicense.png)](https://gitgud.io/SnarkySnappySS13/ShartyStation13/-/raw/master/.gitlab/images/soylicense.png)

All code after [commit 0d8a06943f4ce6b13159e2d90aa5b528e73ecd5c on 2025-10-10 at 12:26 PM CST](https://gitgud.io/snarkysnappyss13/ShartyStation13/-/commit/0d8a06943f4ce6b13159e2d90aa5b528e73ecd5c) is under the soyjak.party© license, which states that all further redistributed substantial copies of this software will include the word "NIGGER" in it, well as having ASCII art of a Soyjak included in it.

See [LICENSE](LICENSE) and [GPLv3.txt](GPLv3.txt) for more details.

---

[![forthebadge](https://forthebadge.com/images/badges/license-mit.svg)](https://forthebadge.com)

The TGS DMAPI is licensed as a subproject under the MIT license.

See the footer of [code/__DEFINES/tgs.dm](./code/__DEFINES/tgs.dm) and [code/modules/tgs/LICENSE](./code/modules/tgs/LICENSE) for the MIT license.

---

[![forthebadge](https://forthebadge.com/images/badges/cc-by-sa.svg)](https://forthebadge.com)

All assets, including icons and sound, are under a [Creative Commons 3.0 BY-SA license](https://creativecommons.org/licenses/by-sa/3.0/) unless otherwise indicated.
