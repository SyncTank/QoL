#pragma once

#ifndef _WINDOWS_
#include <Windows.h>
#include <psapi.h>
#include <tlhelp32.h>
#endif

#include <iostream>
#include <fstream>
#include <stdio.h>
#include <locale>
#include <codecvt>

#include <tchar.h>
#include <vector>
#include <unordered_map>

#include <nfd.h>

#include <algorithm>
#include <thread>
#include <chrono>
#include <cstdlib>
#include <sstream>

namespace Core {

	void PrintHelloWorld();

	void IterProcess_CPP(std::vector<DWORD>&);

	void IterProcess_C(DWORD*, DWORD);

	void PrintProcessAll(DWORD);
	
	void ProcessList(std::unordered_map<std::wstring, std::vector<DWORD>>&);

	void KillProcess(std::vector<DWORD>);

	std::vector<DWORD> GetProcessIDs(const std::wstring& processName);

}