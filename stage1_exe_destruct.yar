import "pe"

rule stage1_exe_destruct {
	meta:
		author = "CD_R0M_"
		description = "Stage1.exe malware, as reported by Micrososft."
    		hash = "a196c6b8ffcb97ffb276d04f354696e2391311db3841ae16c8c9f56f36a38e92"
    		reference = "https://www.microsoft.com/security/blog/2022/01/15/destructive-malware-targeting-ukrainian-organizations"
		HundredDaysofYARA = "Day 16"
	
  	strings:
		$a1= "your hard drive has been corrupted." ascii wide
    		$a2 = "In case you want to recover all hard drives" ascii wide
    		$a3 = "send message via" ascii wide
		
	condition:
		uint16(0) == 0x5A4D
		and all of ($a*)
    		and pe.imports("kernel32.dll", "LoadLibraryA")
		and pe.imports("msvcrt.dll", "memcpy")
}
