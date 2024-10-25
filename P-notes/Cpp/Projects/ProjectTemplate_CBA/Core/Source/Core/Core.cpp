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

	void StoreProcess(std::vector<DWORD>& aProcess) // runs once on startup to initialize the list
	{
		// Get list of process identifiers
		DWORD cbNeeded, cProcesses;

		if (!EnumProcesses(aProcess.data(), static_cast<DWORD>(aProcess.size() * sizeof(DWORD)), &cbNeeded)) {
			std::cerr << "Failed to enumerate processes." << std::endl;
			return; // Exit the function on failure
		}
    
		// Calculate how many process identifiers were returned
		cProcesses = cbNeeded / sizeof(DWORD);

		aProcess.resize(cProcesses); // resize vector
    
		// Print Name & process identifiers for each process
		for (const auto& processID : aProcess) {
			if (processID != 0) {
				std::cout << "Process ID: " << processID << std::endl;
			}
		}
	}

	void ListProcess(DWORD* Processes)
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