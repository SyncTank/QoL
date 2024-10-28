#include "Core.h"

namespace Core {

	void PrintHelloWorld()
	{
		std::cout << "Hello World!\n";
		std::cin.get();
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
		//for (const auto& processID : aProcess) {
		//	if (processID != 0 && processID != 3435973836) {
		//		//std::cout << "Process ID: " << processID << std::endl;
		//		PrintProcess(processID);
		//	}
		//}
	}

	void ListProcess(DWORD* aProcesses, size_t size)
	{
		// get list of process identifiers
		//DWORD aProcesses[1024];
		DWORD cbNeeded, cProcesses;
		//unsigned int i;

		if (!EnumProcesses(aProcesses, size, &cbNeeded))
		{
			return;
		}

		// Calculate how many pIdentifier were returned
		cProcesses = cbNeeded / sizeof(DWORD);

		// Print Name & process identifiers for each process
		for (auto i = 0; i < cProcesses; i++)
		{
			if (aProcesses[i] != 0)
			{
				PrintProcess(aProcesses[i]);
			}
		}

	}

	void PrintProcess(DWORD processID)
	{
		TCHAR szProcessName[MAX_PATH] = TEXT("<unknown>");
		MODULEINFO szInfoBuffer{};
		TCHAR FileNamebuffer[MAX_PATH];

		// get handle of process
		HANDLE hProcess = OpenProcess( PROCESS_QUERY_INFORMATION |
										PROCESS_VM_READ,
										FALSE, processID);
		// Get process name
		if (NULL != hProcess)
		{
			HMODULE hMod;
			DWORD cbNeeded;

			if ( EnumProcessModulesEx(hProcess, &hMod, sizeof(hMod),
				&cbNeeded, LIST_MODULES_ALL) )
			{
				GetModuleBaseName(hProcess, hMod, szProcessName,
					sizeof(szProcessName) / sizeof(TCHAR));

				GetModuleInformation(hProcess, hMod, &szInfoBuffer,
					sizeof(szInfoBuffer));

				GetModuleFileNameEx(hProcess, NULL, FileNamebuffer, MAX_PATH);

			}

			// Print the process name & identifier
			_tprintf(TEXT("%s (PIDL %u)\n"), szProcessName, processID);
			std::cout << szInfoBuffer.EntryPoint << "\t" << szInfoBuffer.lpBaseOfDll << "\t" << szInfoBuffer.SizeOfImage << std::endl;
			std::wcout << "FileName : " << FileNamebuffer;
		}

		// Release the handler to process
		CloseHandle(hProcess);
	}

	void KillProcess(DWORD pid)
	{
		std::cout << "Something in is the dark, " << pid;

		HANDLE hProcess = OpenProcess(PROCESS_TERMINATE, FALSE, pid);

		if (hProcess == NULL) 
		{
			std::cout << "Failed to open process," << GetLastError();
			return;
		}

		if (!TerminateProcess(hProcess, 0))
		{
			std::cout << "Failed to terminate process: " << GetLastError() << std::endl;
		}
		else {
			std::cout << "Process terminated successfully." << std::endl;
		}

		std::cout << "Murder Murder there has been a bloody Murder";

		CloseHandle(hProcess);
	}

}