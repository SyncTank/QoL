#pragma once

#ifndef _WINDOWS_
#include <Windows.h>
#endif

#include <iostream>
#include <psapi.h>
#include <tchar.h>
#include <vector>
#include <stdexcept>

namespace Core {

	struct Process
	{
		std::vector<TCHAR> PIDs;
		std::string name = "";
	};

	void PrintHelloWorld();

	void KillProcess(DWORD);

	void IterProcess_C(DWORD*, DWORD size);

	void PrintProcessAll(DWORD processID);

	void ProcessList(std::vector<Core::Process>& ProcessWhitelist, std::vector<DWORD>& aProcess);

	void IterProcess_CPP(std::vector<DWORD>&);

}