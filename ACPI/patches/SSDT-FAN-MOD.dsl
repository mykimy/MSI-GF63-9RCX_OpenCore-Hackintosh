/*
 * MSI Laptop "quiet" fan patch.
 */
DefinitionBlock("", "SSDT", 2, "hack", "_FANQ", 0)
{
    External(\_SB.PCI0.LPCB.EC.SCM0.TD71, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC.SCM0.TD72, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC.SCM0.TD73, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC.SCM0.TD74, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC.SCM0.TD75, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC.SCM0.TD76, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC.SCM0.TD77, FieldUnitObj)
        
	Device (MFAN)
	{   
        Name(_HID, "MFAN0000") // _HID: Hardware ID
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }

        Method(_INI)
        {
            QMOD()
        }
        
        Method(QMOD)
        {
            \_SB.PCI0.LPCB.EC.SCM0.TD71 = 0            
            \_SB.PCI0.LPCB.EC.SCM0.TD72 = 0
            \_SB.PCI0.LPCB.EC.SCM0.TD73 = 0x14
            \_SB.PCI0.LPCB.EC.SCM0.TD74 = 0x23
            \_SB.PCI0.LPCB.EC.SCM0.TD75 = 0x32
            \_SB.PCI0.LPCB.EC.SCM0.TD76 = 0x3C
            \_SB.PCI0.LPCB.EC.SCM0.TD77 = 0x50
        }
	}
}
