#include "Core.h"

namespace Core {

	void PrintHelloWorld()
	{
		std::cout << "Hello World!\n";
		std::cin.get();
	}

	void PrintDebug() 
	{
	
		std::cout << "\nStep\n";

	}

	void StoreProcesses()
	{
		// get list of process identifiers
		DWORD aProcesses[1024], cbNeeded, cProcesses;
		unsigned int i;

		if (!EnumProcesses(aProcesses, sizeof(aProcesses), &cbNeeded))
		{
			return;
		}

		// Calculate how many pIdentifier were returned
		cProcesses = cbNeeded / sizeof(DWORD);

		// Print Name & process identifiers for each process
		for (i = 0; i < cProcesses; i++)
		{
			if (aProcesses[i] != 0)
			{
				PrintProcessNameAndID(aProcesses[i]);
			}
		}
	}

	DWORD ReturnProcesses(DWORD* aProcesses, DWORD cbNeeded, DWORD cProcesses)
	{
		DWORD test;

		return test;
	}

	void ListProcess() 
	{
		// get list of process identifiers
		DWORD aProcesses[1024], cbNeeded, cProcesses;
		unsigned int i;

		if (!EnumProcesses(aProcesses, sizeof(aProcesses), &cbNeeded))
		{
			return;
		}

		// Calculate how many pIdentifier were returned
		cProcesses = cbNeeded / sizeof(DWORD);

		// Print Name & process identifiers for each process
		for (i = 0; i < cProcesses; i++)
		{
			if (aProcesses[i] != 0)
			{
				PrintProcessNameAndID(aProcesses[i]);
			}
		}
	}

	void PrintProcessNameAndID(DWORD processID)
	{
		TCHAR szProcessName[MAX_PATH] = TEXT("<unknown>");

		// get handle of process
		HANDLE hProcess = OpenProcess( PROCESS_QUERY_INFORMATION |
										PROCESS_VM_READ,
										FALSE, processID);
		// Get process name
		if (NULL != hProcess)
		{
			HMODULE hMod;
			DWORD cbNeeded;

			if ( EnumProcessModules(hProcess, &hMod, sizeof(hMod),
				&cbNeeded) ) 
			{
				GetModuleBaseName(hProcess, hMod, szProcessName,
					sizeof(szProcessName) / sizeof(TCHAR));
			}
		}

		// Print the process name & identifier
		_tprintf(TEXT("%s (PIDL %u)\n"), szProcessName, processID);

		// Release the handler to process
		CloseHandle(hProcess);
	}

}