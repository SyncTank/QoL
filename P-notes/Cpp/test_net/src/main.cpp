#include "WinSock2.h"
#include <cstdlib>
#include <iostream>
#include <windows.h>
#include <ws2tcpip.h>

int main(void) {
  WSAData wsaData;

  if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0) {
    std::cout << "WSAStartup failed with error: " << WSAGetLastError()
              << std::endl;
    return 1;
  } else {
    std::cout << "\nwsaData Started\n";
  }

  STARTUPINFO si;
  PROCESS_INFORMATION pi;

  ZeroMemory(&si, sizeof(si));
  si.cb = sizeof(si);
  ZeroMemory(&pi, sizeof(pi));

  // Start the child process.
  if (!CreateProcess(
          NULL, // No module name (use command line)
          (LPSTR) "C:\\Windows\\System32\\notepad.exe", // Command line
          NULL,  // Process handle not inheritable
          NULL,  // Thread handle not inheritable
          FALSE, // Set handle inheritance to FALSE
          0,     // No creation flags
          NULL,  // Use parent's environment block
          NULL,  // Use parent's starting directory
          &si,   // Pointer to STARTUPINFO structure
          &pi)   // Pointer to PROCESS_INFORMATION structure
  ) {
    std::cerr << "CreateProcess failed (" << GetLastError() << ").\n";
    WSACleanup();
    return 1;
  }

  // Wait until child process exits.
  WaitForSingleObject(pi.hProcess, INFINITE);

  // Close process and thread handles.
  CloseHandle(pi.hProcess);
  CloseHandle(pi.hThread);

  WSACleanup();
}
