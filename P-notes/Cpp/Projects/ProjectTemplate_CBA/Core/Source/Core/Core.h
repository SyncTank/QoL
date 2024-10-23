#pragma once

#ifndef _WINDOWS_
#include <Windows.h>
#endif

#include <iostream>
#include <psapi.h>
#include <tchar.h>

namespace Core {

	void PrintHelloWorld();

	void PrintDebug();

	void ListProcess();

	void PrintProcessNameAndID(DWORD processID);

}