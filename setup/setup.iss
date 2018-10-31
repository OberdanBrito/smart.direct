; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Smart Direct"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "Craos.NET"
#define MyAppURL "http://www.craos.net/"
#define MyAppExeName "smart.direct.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{B050010F-BE2C-4731-80D9-53BDCC810593}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\Craos
DisableProgramGroupPage=yes
OutputDir=C:\Users\Administrador\source\repos\smart.gnav\smart.gnav\setup
OutputBaseFilename=smart.direct
SetupIconFile=C:\Users\Administrador\source\repos\smart.gnav\smart.gnav\setup\smart.direct.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\Administrador\source\repos\smart.gnav\smart.gnav\bin\Debug\smart.direct.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Administrador\source\repos\smart.gnav\smart.gnav\bin\Debug\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "vcredist_x64.exe"; DestDir: {tmp}; Flags: deleteafterinstall
Source: "vcredist_x86.exe"; DestDir: {tmp}; Flags: deleteafterinstall

[Run]
Filename: {tmp}\vcredist_x64.exe; \
    Parameters: "/q /passive /Q:a /c:""msiexec /q /i vcredist.msi"""; \
    StatusMsg: "Instalando Visual C++ 2013 x64"

[Run]
Filename: {tmp}\vcredist_x86.exe; \
    Parameters: "/q /passive /Q:a /c:""msiexec /q /i vcredist.msi"""; \
    StatusMsg: "Instalando Visual C++ 2013 x86"

    
[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

