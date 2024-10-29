#pragma once

#ifndef _WINDOWS_
#include <Windows.h>
#endif

#include <iostream>
#include <psapi.h>
#include <tchar.h>
#include <vector>
#include <unordered_map>

namespace Core {

	void PrintHelloWorld();

	void KillProcess(DWORD);

	void IterProcess_C(DWORD*, DWORD);

	void PrintProcessAll(DWORD);
	
	void ProcessList(std::unordered_map<std::wstring, std::vector<DWORD>>&);
	//void ProcessList(std::vector<Core::Process>& ProcessWhitelist, std::vector<DWORD>& aProcess);

	void IterProcess_CPP(std::vector<DWORD>&);

}