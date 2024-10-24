#include "Core/Core.h"

int main()
{
	std::vector<DWORD> Processes(1024);
	//Core::PrintDebug();

	//Core::ListProcess();

	Core::StoreProcess(Processes);

	//Core::PrintHelloWorld();

	for (const auto& processID : Processes) {
		if (processID != 0) {
			std::cout << "Process ID: " << processID << std::endl;
		}
	}



}