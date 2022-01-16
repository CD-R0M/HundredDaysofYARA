rule Control_RunDLL {
	meta:
		author = "CD_R0M_"
		description = "Identify binaries with Control_RunDLL, which can be used by malware to utilize functionality of DLL's"
		HundredDaysofYARA = "Day 15"
	strings:
		$str1 = "Control_RunDLL" nocase
		$str2 = "DllInstall" nocase
		$str3 = "DllRegisterServer" nocase
		$str4 = "DllUnregisterServer" nocase
		$str5 = "go" nocase
		$str6 = "remove" nocase
		$str7 = "run" nocase
		$str8 = "start" nocase

	condition:
		uint16(0) == 0x5A4D and all of ($str*) and not pe.imphash() == "fd009773edcd9609debe303429866bca"
}

rule Control_RunDLL_1DLL {
	meta:
		author = "CD_R0M_"
		description = "Control_RunDLL, with 1.dll which was identified in multiple samples"
		HundredDaysofYARA = "Day 15"
	strings:
		$str1 = "Control_RunDLL" nocase
		$str2 = "DllInstall" nocase
		$str3 = "DllRegisterServer" nocase
		$str4 = "DllUnregisterServer" nocase
		$str5 = "go" nocase
		$str6 = "remove" nocase
		$str7 = "run" nocase
		$str8 = "start" nocase
	
		$dll = "1.dll"
	condition:
		uint16(0) == 0x5A4D and all of ($str*) and $dll  and not pe.imphash() == "fd009773edcd9609debe303429866bca"
}
