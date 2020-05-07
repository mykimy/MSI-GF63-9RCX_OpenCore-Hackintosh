// This SSDT turn off the dGPU after wake.
// Otherwise, upon waking the laptop the dGPU might be residually powered
// and power consumption jumps (ex. 1.5W idle to 5W idle), which kills battery life.
//
// DSDT patches to rename _WAK to ZWAK are needed.
DefinitionBlock("", "SSDT", 2, "hack", "PTSWAK", 0)
{
    External(ZWAK, MethodObj)
    External(_SB.PCI0.PEG0.PEGP._OFF, MethodObj)

    Method(_WAK, 1)
    {
        // call into original _WAK method
        Local0 = ZWAK(Arg0)

        If (_OSI ("Darwin"))
        {
            // disable discrete graphics
            \_SB.PCI0.PEG0.PEGP._OFF()
        }

        // return value from original _WAK
        Return (Local0)
    }
}
