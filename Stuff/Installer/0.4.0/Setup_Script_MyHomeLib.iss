[Setup]
AppName=MyHomeLib
PrivilegesRequired=poweruser
DefaultDirName={pf}\MyHomeLib\
DefaultGroupName=MyHomeLib
AppID={{B9B6C409-01CB-4AB6-8E4F-403B49A25B56}
OutputDir=.
SourceDir=.
AppVerName=My Home Library v.1.6.1
AppCopyright=© 2009 Aleksey Penkov
UninstallDisplayIcon={app}\MyHomeLib.exe
WizardImageFile=..\Images\SetupModern20.bmp
WizardSmallImageFile=..\Images\SetupModernSmall20.bmp
SetupIconFile=..\Images\Setup.ico
OutputBaseFilename=Setup_MyHomeLib_1_6_1
AppPublisherURL=http://home-lib.net/
AppSupportURL=http://forum.home-lib.net/
AppUpdatesURL=http://home-lib.net/
UsePreviousAppDir=yes
AllowNoIcons=yes
Compression=lzma/ultra
SolidCompression=yes
LicenseFile=License.txt
VersionInfoVersion=1.6.1.627

[Dirs]
Name: "{userappdata}\MyHomeLib"; Permissions: everyone-modify
[Files]
Source: .\AlReader\*.*; DestDir: {app}\AlReader
Source: .\AlReader\AlReader2\*.*; DestDir: {app}\AlReader\AlReader2\
Source: .\converters\fb2lrf\*.*; DestDir: {app}\converters\fb2lrf\
Source: .\converters\fb2pdf\*.*; DestDir: {app}\converters\fb2pdf\
Source: .\converters\fb2epub\*.*; DestDir: {app}\converters\fb2epub\
Source: .\genres_nonfb2.glst; DestDir: {app}
Source: .\genres_fb2.glst; DestDir: {app}
Source: .\librusec.inpx; DestDir: {userappdata}\MyHomeLib
Source: .\TheFirstRun.check; DestDir: {userappdata}\MyHomeLib
Source: .\MyHomeLib.exe; DestDir: {app}; Flags: replacesameversion
Source: .\MyHomeLib.chm; DestDir: {app}
Source: .\MyHomeLib.url; DestDir: {app}
Source: .\License.txt; DestDir: {app}
[Icons]
Name: {group}\MyHomeLib; Filename: {app}\MyHomeLib.exe; WorkingDir: {app}; IconFilename: {app}\MyHomeLib.exe; IconIndex: 0; Comment: My Home Library
Name: {group}\Справка по MyHomeLib; Filename: {app}\MyHomeLib.chm; WorkingDir: {app}; IconFilename: {sys}\ieframe.dll; IconIndex: 36; Comment: My Home Library Help
Name: {commondesktop}\MyHomeLib; Filename: {app}\MyHomeLib.exe; WorkingDir: {app}; IconFilename: {app}\MyHomeLib.exe; IconIndex: 0; Comment: My Home Library; Tasks: desktopicon
Name: {group}\My Home Lib web site; Filename: {app}\MyHomeLib.url; IconFilename: {sys}\ieframe.dll; IconIndex: 36
Name: {group}\{cm:UninstallProgram, My Home Library}; Filename: {uninstallexe}
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\MyHomeLib"; Filename: "{app}\MyHomeLib.exe"; Tasks: quicklaunchicon
[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}
Name: "quicklaunchicon"; Description: "Create a &Quick Launch icon"; GroupDescription: "Additional icons:"; Flags: unchecked

[Languages]
Name: Russian; MessagesFile: compiler:Languages\Russian.isl
Name: English; MessagesFile: compiler:Default.isl
Name: Ukrainian; MessagesFile: ..\Images\Ukrainian-6-5.1.11.isl
[UninstallDelete]
Name: {userappdata}\MyHomeLib\Data; Type: filesandordirs
Name: {userappdata}\MyHomeLib\Presets; Type: filesandordirs
Name: {userappdata}\MyHomeLib\*.*; Type: files
Name: {userappdata}\MyHomeLib; Type: dirifempty
Name: {app}; Type: files
[Run]
Filename: {app}\MyHomeLib.exe; WorkingDir: {app}; Description: {cm:LaunchProgram,My Home Library}; Flags: nowait postinstall skipifsilent; Check: ; Tasks:




