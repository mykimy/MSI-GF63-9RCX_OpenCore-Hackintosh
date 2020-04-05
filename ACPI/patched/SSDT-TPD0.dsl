// Necessary hotpatch for voodoo I2C
// OSYS = 0x07DF to let TPD0._CRS return (SBFB,SBFG)

DefinitionBlock ("", "SSDT", 2, "hack", "_TPD0", 0x00000000)
{
    External (_SB_.PCI0.I2C2.TPD0, DeviceObj)

    Scope (_SB.PCI0.I2C2.TPD0)
    {
        Name (OSYS, 0x07DF)
    }
}