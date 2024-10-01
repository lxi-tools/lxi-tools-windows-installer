!define COMPANYNAME "Lxi-Tools"
!define APPNAME "Lxi-Tools-$%BUILD_VERSION%"
!define DESCRIPTION "Lxi Tools "

Name "${COMPANYNAME} - ${APPNAME}"

Icon "..\lxi-tools\build\src\lxi-tools.ico"

Outfile "lxi-tools-$%BUILD_VERSION%.exe"

InstallDir "C:\${COMPANYNAME}"
  #\${APPNAME}"

page directory
Page instfiles
UninstPage uninstConfirm
UninstPage instfiles

# start default section
Section "install"
    Var /GLOBAL PROD_VERSION

    StrCpy $PROD_VERSION  $%BUILD_VERSION%

    # set the installation directory as the destination for the following actions
    SetOutPath $INSTDIR

    #File  "lxi-tools.ico"
    File /oname=$TEMP\lxi-tools.ico ..\lxi-tools\build\src\lxi-tools.ico

    File /r "..\lxi-tools-redistributable\*"

    # create the uninstaller
    WriteUninstaller uninstaller.exe

    CopyFiles $TEMP\lxi-tools.ico $%APP_DATA%\lxi-tools.ico
    # create a shortcut named "new shortcut" in the start menu programs directory
    # point the new shortcut at the program uninstaller

    CreateDirectory "$SMPROGRAMS\${COMPANYNAME}"
    CreateDirectory "$SMPROGRAMS\${COMPANYNAME}\$%BUILD_VERSION%"
    CreateShortCut "$SMPROGRAMS\${COMPANYNAME}\$%BUILD_VERSION%\lxi-gui.lnk" "$INSTDIR\$%APP_DATA%\bin\lxi-gui" "" "$INSTDIR\$%APP_DATA%\lxi-tools.ico"
    CreateShortCut "$INSTDIR\lxi-gui.lnk" "$INSTDIR\$%APP_DATA%\bin\lxi-gui" "" "$INSTDIR\$%APP_DATA%\lxi-tools.ico"

    # Registry information for add/remove programs
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "DisplayName" "${COMPANYNAME}"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "UninstallString" "$\"$INSTDIR\uninstaller.exe$\""
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "QuietUninstallString" "$\"$INSTDIR\uninstaller.exe$\" /S"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "InstallLocation" "$\"$INSTDIR$\""
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "DisplayIcon" "$\"$INSTDIR\$%APP_DATA%\lxi-tools.ico$\""
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "Publisher" "$\"${COMPANYNAME}$\""
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "DisplayVersion" "$\"$PROD_VERSION$\""
    # There is no option for modifying or repairing the install
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "NoModify" 1
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "NoRepair" 1

    Delete $TEMP\lxi-tools.ico
SectionEnd

function un.onInit
    # SetShellVarContext all

    #Verify the uninstaller - last chance to back out
    MessageBox MB_OKCANCEL "Are you sure you want to remove Lxi Tools?" IDOK next
        Abort
    next:
functionEnd

# uninstaller section start
Section "uninstall"
    # SetShellVarContext all

    rmDir /r "$SMPROGRAMS\${COMPANYNAME}"
    rmDir /r "$INSTDIR"

    # Remove uninstaller information from the registry
    DeleteRegKey HKLM "Software\${COMPANYNAME} ${APPNAME}"
    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}"

    # SetAutoClose true
SectionEnd
