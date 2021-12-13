@echo off
title Texture/Resource pack (1.8+) Datapack (1.17+) 

:Main
echo Texture/Resource pack or datapack?
echo [TP] Texture/Resource pack
echo [DP] Datapack (Not finished, only functions)
echo.
echo.
echo [I] Info
set /p M=[:
if /i %M%==TP goto TP
if /i %M%==DP goto DP
if /i %M%==I goto Inf

:TP
echo [RP] Resourcepack
echo [TP] Resourcepack (Textures Only)
echo.
echo [B] Back
set /p TP=[:
if /i %TP%==B cls && goto Main
if /i %TP%==TP cls && goto TPN
if /i %TP%==RP cls && goto RPN



:RPN
echo Enter a name for the Resourcepack
echo.
echo DO NOT write spaces if you want to use 2 words write with "_"
echo DO NOT write capital letters!!!
echo DO NOT write symbols!!!
set /p RP=Name:
md %RP%

goto setupRP



:TPN
echo Enter a name for the Texturepack
echo.
echo DO NOT write spaces if you want to use 2 words write with "_"
echo DO NOT write capital letters!!!
echo DO NOT write symbols!!!
set /p NO=Name:
md %NO%

goto setupTP

:DP
echo Datapacks
echo.
echo [F] functions
echo [CR] crafting recipes

echo.
echo [B] Back
set /p TP=[:
if /i %TP%==B cls && goto Main
if /i %TP%==F cls && goto DPNF
if /i %TP%==CR cls && goto DPNCR


:DPNF
echo Enter a name for the functions data pack
echo.
echo DO NOT write spaces if you want to use 2 words write with "_"
echo DO NOT write capital letters!!!
echo DO NOT write symbols!!!
set /p DPF=Name:
md %DPF%

goto setupDPF

:DPNCR
echo Enter a name for the crafting recipes data pack
echo.
echo DO NOT write spaces if you want to use 2 words write with "_"
echo DO NOT write capital letters!!!
echo DO NOT write symbols!!!
set /p DPCR=Name:
md %DPCR%

goto setupDPCR


:setupTP
echo {"pack": {"pack_format": 2,"description": "My Resourcepack"}} >> %NO%\pack.mcmeta
md %NO%\assets
md %NO%\assets\minecraft
md %NO%\assets\minecraft\textures
xcopy "assets\rptp\RPTP\assets\minecraft\textures" "%NO%\assets\minecraft\textures" /E

goto TutRPTP



:setupDPF
echo { "pack": { "pack_format": 7, "description": "My Datapack" } } >> %DPF%\pack.mcmeta
md %DPF%\data
md %DPF%\data\minecraft
md %DPF%\data\minecraft\tags
md %DPF%\data\minecraft\tags\functions
md %DPF%\data\minecraft\tags\functions\
echo { "values": [ "%DPF%:load" ] } >> %DPF%\data\minecraft\tags\functions\load.json
echo { "values": [ "%DPF%:tick" ] } >> %DPF%\data\minecraft\tags\functions\tick.json
md %DPF%\data\%DPF%
md %DPF%\data\%DPF%\functions
echo. >> %DPF%\data\%DPF%\functions\tick.mcfunction
echo tellraw @a {"text": "the Datapack loaded %DPF%", "color": "#0000FF"} >> %DPF%\data\%DPF%\functions\load.mcfunction

echo Do you want a Tutorial?
echo.
echo [y] yes
echo [n] no
set /p DT=[:
if /i %DT%==y Start https://minecraft.fandom.com/wiki/Tutorials/Creating_a_resource_pack && exit
if /i %DT%==n exit

:setupDPCR
echo { "pack": { "pack_format": 7, "description": "My Datapack" } } >> %DPCR%\pack.mcmeta
md %DPCR%\data
md %DPCR%\data\crafting\recipes\
xcopy "assets\dp\cr\example_spawner.json" "%DPCR%\data\crafting\recipes\" /E

echo Do you want a Tutorial?
echo.
echo [y] yes
echo [n] no
set /p DT=[:
if /i %DT%==y Start https://minecraft.fandom.com/wiki/Tutorials/Creating_a_resource_pack && exit
if /i %DT%==n exit


:Inf
cls
echo this program creates a complete resource, texture or data packs
echo such as the folders, pictures and the files necessary for it to work
echo.
echo [B] Back
set /p I=[:
if /i %I%==B cls && goto Main 


:setupRP
echo {"pack": {"pack_format": 2,"description": "My Resourcepack"}} >> %RP%\pack.mcmeta
md %RP%\assets
xcopy "assets\rptp\RPTP\assets" "%RP%\assets" /E

goto TutRPTP



:TutRPTP
echo Do you want a Tutorial?
echo.
echo [y] yes
echo [n] no
set /p TT=[:
if /i %TT%==y Start https://minecraft.fandom.com/wiki/Tutorials/Creating_a_resource_pack && exit
if /i %TT%==n exit
