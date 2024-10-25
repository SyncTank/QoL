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




}