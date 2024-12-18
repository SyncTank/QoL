#include "Core/Core.h"

int main()
{
	using namespace std::chrono;

	std::unordered_map<std::wstring, std::vector<DWORD>> totalProcessList;
	std::vector<std::wstring> blackList;

	Core::ProcessList(totalProcessList);

	// TODO  : Blacklist 
	// Processlist doesn't update when timer is going
	// Timer

	//Core::PrintHelloWorld();
	std::wstring processName = L"GitHubDesktop.exe"; 
	std::vector<DWORD> processIDs = Core::GetProcessIDs(processName); 
	for (DWORD pid : processIDs) 
	{
		std::wcout << L"Found process ID: " << pid << std::endl;
	}

	duration<int, std::ratio<60 * 60 * 24> > one_day(1);

	system_clock::time_point today = system_clock::now();
	system_clock::time_point tomorrow = today + one_day;

	time_t tt;
	time_t tt2;

	tt = system_clock::to_time_t(today);
	std::cout << "today is: " << ctime(&tt);

	tt2 = system_clock::to_time_t(tomorrow);
	std::cout << "tomorrow will be: " << ctime(&tt2);
	
	for (;;)
	{

		duration<int, std::ratio<60 * 60 * 24> > one_day(1);

		system_clock::time_point today = system_clock::now();
		system_clock::time_point tomorrow = today + one_day;

		time_t tt;
		time_t tt2;

		tt = system_clock::to_time_t(today);
		std::cout << "today is: " << ctime(&tt);

		tt2 = system_clock::to_time_t(tomorrow);
		std::cout << "tomorrow will be: " << ctime(&tt2);

		system("cls");
	}
		
	std::cout << "AGAIN!\n\n\n\n";
	
	//Core::IterProcess_CPP(Processes);

}