/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLWRsQA3.aml, Mon Dec 23 22:56:00 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000ED (237)
 *     Revision         0x02
 *     Checksum         0x9B
 *     OEM ID           "hack"
 *     OEM Table ID     "elan"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "asus", 0x00000000)
{
    External (_SB_, DeviceObj)    // (from opcode)
    External (_SB_.ATKD, DeviceObj)    // (from opcode)

    Scope (_SB_)
    {
        //Fake ALS
        Device(ALS0)
        {
            Name(_HID, "ACPI0008")
            Name(_CID, "smc-als")
            Name(_ALI, 150)
            Name(_ALR, Package()
            {
                Package() { 100, 150 },
            })
        }
    }

    Scope (_SB_.ATKD)
    {   
        //Fake ALS
        Method (ALSS, 0, NotSerialized)
        {
            Return (^^ALS0._ALI)
        }
        Method (ALSC, 1, NotSerialized)
        {
            // This method does nothing
        }
    }
}

