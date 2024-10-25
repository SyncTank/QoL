#include "Core/Core.h"

int main()
{
	//std::vector<DWORD> Processes(1024);
	DWORD Processes[1024];

	//Core::PrintDebug();

	Core::ListProcess(Processes);

	//Core::StoreProcess(Processes);

	//Core::PrintHelloWorld();

	for (const auto Process : Processes)
	{
		if (Process != 0) {
			std::cout << "Process ID: " << Process << std::endl;
		}
	}

}