/* 
 * The purpose of this implementation is to avoid "instant wake"
 * by returning 0 in the second position (sleep state supported)
 * of the return package.
 * In config ACPI, GPRW to XPRW
 * Find:     47505257 02
 * Replace:  58505257 02
 */
DefinitionBlock ("", "SSDT", 2, "Slav", "GPRW", 0x00000000)
{
    External (XPRW, MethodObj)

    Method (GPRW, 2, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            While (One)
            {
                If ((0x6D == Arg0))
                {
                    Return (Package (0x02)
                    {
                        0x6D,
                        Zero
                    })
                }

                If ((0x0D == Arg0))
                {
                    Return (Package (0x02)
                    {
                        0x0D,
                        Zero
                    })
                }

                Break
            }
        }

        Return (XPRW (Arg0, Arg1))
    }
}

