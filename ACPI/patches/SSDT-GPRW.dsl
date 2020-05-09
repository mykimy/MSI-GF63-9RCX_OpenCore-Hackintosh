// The purpose of this implementation is to avoid "instant wake"
// by returning 0 in the second position (sleep state supported)
// of the return package.
// In config ACPI, GPRW to XPRW
// Find:     47505257 02
// Replace:  58505257 02
DefinitionBlock ("", "SSDT", 2, "hack", "GPRW", 0)
{
    External(XPRW, MethodObj)
    
    Method (GPRW, 2, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            If ((0x6D == Arg0))
            {
                Return (Package ()
                {
                    0x6D, 
                    Zero
                })
            }

            If ((0x0D == Arg0))
            {
                Return (Package ()
                {
                    0x0D, 
                    Zero
                })
            }
        }
        
        Return (XPRW (Arg0, Arg1))
    }
}

