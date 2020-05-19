/*
 * Custom ACPI methods call on wake event.
 */
DefinitionBlock("", "SSDT", 2, "hack", "PTSWAK", 0)
{
    External(ZWAK, MethodObj)
    External(RMD1.DOFF, MethodObj)
    External(MFAN.QMOD, MethodObj)

    Method(_WAK, 1)
    {
        // call into original _WAK method
        Local0 = ZWAK(Arg0)

        If (_OSI ("Darwin"))
        {
            // disable discrete graphics
            \RMD1.DOFF()
            // fan mod
            \MFAN.QMOD()
        }

        // return value from original _WAK
        Return (Local0)
    }
}
