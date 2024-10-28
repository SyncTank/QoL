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

	for (const auto ListedProcess : ProcessWhitelist)
	{
		Core::PrintProcessAll(ListedProcess.PIDs[0]);
	}

	//Core::PrintHelloWorld();
	std::cin.get();


 	std::wstring Test = L"GitHubDesktop.exe";
	for (;;)
	{
		int i = 0;
		for (const auto ProcessID : ProcessWhitelist)
		{
			if (ProcessID.name == Test)
			{
				ProcessWhitelist.erase(ProcessWhitelist.begin()+i);
				if (ProcessID.PIDs.size() > 1)
				{
					for (const auto pi : ProcessID.PIDs)
					{
						Core::KillProcess(pi);
					}
				}
				else
				{
					Core::KillProcess(ProcessID.PIDs[0]);
				}
			}
			i++;
		}
		Core::IterProcess_CPP(Processes);
		ProcessWhitelist.resize(Processes.size());

		Core::ProcessList(ProcessWhitelist, Processes);
	}
	end:;
	
	std::cout << "AGAIN!\n\n\n\n";
	
	//Core::IterProcess_CPP(Processes);

}