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
DefinitionBlock ("", "SSDT", 2, "hack", "elan", 0x00000000)
{
    External (_SB_.PCI0.GPI0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.I2C1.ETPD, DeviceObj)    // (from opcode)

    Method (_SB.PCI0.GPI0._STA, 0, NotSerialized)  // _STA: Status
    {
        Return (0x0F)
    }

    Scope (_SB.PCI0.I2C1.ETPD)
    {
        Name (SBFG, ResourceTemplate ()
        {
            GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x006D
                }
        })
        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
        {
            Name (SBFB, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                    0x00, ResourceConsumer, , Exclusive,
                    )
            })
            Return (ConcatenateResTemplate (SBFB, SBFG))
        }
    }
}

