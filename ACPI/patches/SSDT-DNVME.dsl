/*
 * Used for disabling unsupported NVMe in macOS
 */
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "spoof", 0x00000000)
{
    External (_SB.PCI0.RP09.PXSX, DeviceObj)

    Method (_SB.PCI0.RP09.PXSX._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If ((!Arg2 || (_OSI ("Darwin") == Zero)))
        {
            Return (Buffer (One)
            {
                 0x03
            })
        }

        Return (Package (0x04)
        {
            "class-code", 
            Buffer (0x04)
            {
                 0xFF, 0x08, 0x01, 0x00
            }, 

            "built-in", 
            Buffer (One)
            {
                 0x00
            }
        })
    }
}

