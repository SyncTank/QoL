#include "Core/Core.h"

int main()
{
	std::vector<DWORD> Processes(1024);
	//const auto processSizeBuffer = 1024;
	//DWORD Processes[processSizeBuffer];

	//Core::IterProcess_C(Processes, processSizeBuffer);

	Core::IterProcess_CPP(Processes);
	std::vector<Core::Process> ProcessWhitelist(Processes.size());

	Core::ProcessList(ProcessWhitelist, Processes);

	//Core::PrintHelloWorld();
	std::cin.get();


 	//DWORD Test = 18324;
	//for (;;)
	//{
	//	Core::IterProcess_CPP(Processes);
	//	for (const auto id : Processes)
	//	{
	//		std::cout << "Checking : " << id << std::endl;
	//		if (id == Test)
	//		{
	//			Core::KillProcess(Test);
	//			return;
	//		}
	//	}
	//	
	//}
	
	
	std::cout << "AGAIN!\n\n\n\n";
	
	Core::IterProcess_CPP(Processes);

}