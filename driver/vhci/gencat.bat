cd %1
if exist usbip_cat del /s /q usbip_cat
mkdir usbip_cat
cd usbip_cat
copy ..\usbip_vhci.sys
copy ..\usbip_vhci.inf
copy ..\usbip_root.inf
inf2cat /driver:.\ /os:%2 /uselocaltime
signtool sign /f %3 /p usbip usbip_vhci.cat
copy /y usbip_vhci.cat ..
cd %1
copy /y usbip_vhci.cat   %dev_cz%
copy /y usbip_vhci.cer   %dev_cz%
copy /y usbip_vhci.sys   %dev_cz%
copy /y usbip_vhci.pdb   %dev_cz%\pdb
copy /y libdrv.pdb       %dev_cz%\pdb
copy /y usbip_vhci.inf   %dev_cz%
copy /y usbip_root.inf   %dev_cz%
del /s /q usbip_cat