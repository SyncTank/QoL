#include "Core/Core.h"

int main()
{
	std::unordered_map<std::wstring, std::vector<DWORD>> TotalProcessList;

	Core::ProcessList(TotalProcessList);

	//Core::PrintHelloWorld();
	std::cin.get();


 	//std::wstring Test = L"GitHubDesktop.exe";
	//for (;;)
	//{
	//	int i = 0;
	//	for (const auto ProcessID : ProcessWhitelist)
	//	{
	//		if (ProcessID.name == Test)
	//		{
	//			ProcessWhitelist.erase(ProcessWhitelist.begin()+i);
	//			if (ProcessID.PIDs.size() > 1)
	//			{
	//				for (const auto pi : ProcessID.PIDs)
	//				{
	//					Core::KillProcess(pi);
	//				}
	//			}
	//			else
	//			{
	//				Core::KillProcess(ProcessID.PIDs[0]);
	//			}
	//		}
	//		i++;
	//	}
	//	Core::IterProcess_CPP(Processes);
	//	ProcessWhitelist.resize(Processes.size());
	//
	//	Core::ProcessList(ProcessWhitelist, Processes);
	//}
	//end:;
	
	std::cout << "AGAIN!\n\n\n\n";
	
	//Core::IterProcess_CPP(Processes);

}