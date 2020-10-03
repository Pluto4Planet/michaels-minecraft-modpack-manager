; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{BD50C80E-CBE1-4F3D-8951-A31D153A4BC3}
AppName=Michael's Minecraft Modpack Manager
AppVersion=1.0
;AppVerName=Michael's Minecraft Modpack Manager 1.0
DefaultDirName={pf}\Michael's Minecraft Modpack Manager
DefaultGroupName=Michael's Minecraft Modpack Manager
DisableProgramGroupPage=yes
OutputBaseFilename=mysetup
Compression=lzma
SolidCompression=yes

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\git-repos\michaels-minecraft-modpack-manager\dist_electron\win-unpacked\michaels-minecraft-modpack-manager.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\git-repos\michaels-minecraft-modpack-manager\dist_electron\win-unpacked\chrome_100_percent.pak"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\git-repos\michaels-minecraft-modpack-manager\dist_electron\win-unpacked\chrome_200_percent.pak"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\git-repos\michaels-minecraft-modpack-manager\dist_electron\win-unpacked\d3dcompiler_47.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\git-repos\michaels-minecraft-modpack-manager\dist_electron\win-unpacked\ffmpeg.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\git-repos\michaels-minecraft-modpack-manager\dist_electron\win-unpacked\icudtl.dat"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\git-repos\michaels-minecraft-modpack-manager\dist_electron\win-unpacked\libEGL.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\git-repos\michaels-minecraft-modpack-manager\dist_electron\win-unpacked\libGLESv2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\git-repos\michaels-minecraft-modpack-manager\dist_electron\win-unpacked\LICENSE.electron.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\git-repos\michaels-minecraft-modpack-manager\dist_electron\win-unpacked\LICENSES.chromium.html"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\git-repos\michaels-minecraft-modpack-manager\dist_electron\win-unpacked\resources.pak"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\git-repos\michaels-minecraft-modpack-manager\dist_electron\win-unpacked\snapshot_blob.bin"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\git-repos\michaels-minecraft-modpack-manager\dist_electron\win-unpacked\v8_context_snapshot.bin"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\git-repos\michaels-minecraft-modpack-manager\dist_electron\win-unpacked\vk_swiftshader.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\git-repos\michaels-minecraft-modpack-manager\dist_electron\win-unpacked\vk_swiftshader_icd.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\git-repos\michaels-minecraft-modpack-manager\dist_electron\win-unpacked\vulkan-1.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\git-repos\michaels-minecraft-modpack-manager\dist_electron\win-unpacked\locales\*"; DestDir: "{app}\locales"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\git-repos\michaels-minecraft-modpack-manager\dist_electron\win-unpacked\resources\*"; DestDir: "{app}\resources"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\git-repos\michaels-minecraft-modpack-manager\dist_electron\win-unpacked\swiftshader\*"; DestDir: "{app}\swiftshader"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\Michael's Minecraft Modpack Manager"; Filename: "{app}\michaels-minecraft-modpack-manager.exe"
Name: "{commondesktop}\Michael's Minecraft Modpack Manager"; Filename: "{app}\michaels-minecraft-modpack-manager.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\michaels-minecraft-modpack-manager.exe"; Description: "{cm:LaunchProgram,Michael's Minecraft Modpack Manager}"; Flags: nowait postinstall skipifsilent
