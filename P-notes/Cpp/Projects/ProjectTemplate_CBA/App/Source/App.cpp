#include "Core/Core.h"

int main()
{
	std::vector<DWORD> Processes(1024);
	//const auto processSizeBuffer = 1024;
	//DWORD Processes[processSizeBuffer];

	//Core::PrintDebug();

	//Core::ListProcess(Processes, processSizeBuffer);

	Core::StoreProcess(Processes);

	//Core::PrintHelloWorld();

 	DWORD Test = 18324;
	for (;;)
	{
		Core::StoreProcess(Processes);
		for (const auto id : Processes)
		{
			std::cout << "Checking : " << id << std::endl;
			if (id == Test)
			{
				Core::KillProcess(Test);
			}
		}
		
	}


	std::cout << "AGAIN!\n\n\n\n";

	Core::StoreProcess(Processes);

}