#pragma once

#ifndef _WINDOWS_
#include <Windows.h>
#endif

#include <iostream>
#include <psapi.h>
#include <tchar.h>
#include <vector>

namespace Core {

	void PrintHelloWorld();

	void PrintDebug();

	void KillProcess(DWORD);

	void ListProcess(DWORD*, size_t size);

	void PrintProcess(DWORD processID);

	void StoreProcess(std::vector<DWORD>&);

}