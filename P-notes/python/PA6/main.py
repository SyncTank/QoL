# import requests
# import json
# import sys
# import pyodbc
import wx


class windowClass(wx.Frame):
    def __init__(self, *args, **kwargs):
        super(windowClass, self).__init__(*args, **kwargs)
        self.Centre()
        self.basicGUI()

    def basicGUI(self):
        panel = wx.Panel(self)
        menuBar = wx.MenuBar()
        fileButton = wx.Menu()
        editButton = wx.Menu()
        importItem = wx.Menu()
        viewItem = wx.Menu()
        # Build a menu entry - text only
        exitItem = fileButton.Append(wx.ID_EXIT, 'Exit', 'Exit sample ...')
        # ID_HOST = wx.NewId()
        viewHostItem = fileButton.Append(
            wx.ID_ANY, 'Host', 'Retrieve Host ...')
        captureItem = fileButton.Append(
            wx.ID_ANY, 'Capture', 'Start Capture Mode ...')
        monitorItem = fileButton.Append(
            wx.ID_ANY, 'Monitor', 'Start Monitor Mode ...')
        menuBar.Append(fileButton, 'File')
        menuBar.Append(editButton, 'Edit')
        self.SetMenuBar(menuBar)
        self.Bind(wx.EVT_MENU, self.Quit, exitItem)
        self.Bind(wx.EVT_MENU, self.ViewHost, viewHostItem)
        self.Bind(wx.EVT_MENU, self.CaptureMode, captureItem)
        self.Bind(wx.EVT_MENU, self.MonitorMode, monitorItem)
        self.statusbar = self.CreateStatusBar(1)
        self.statusbar.SetStatusText('Waiting To Start')
        self.SetTitle('Rudy - My App 2025-04-09 ')
        button = wx.Button(panel, label="Select File", pos=(150, 100))
        button.Bind(wx.EVT_BUTTON, self.on_open_file)
        self.text_area = wx.TextCtrl(panel, pos=(
            50, 150), size=(300, 100), style=wx.TE_MULTILINE)
        self.Show(True)

    def Quit(self, e):
        yesNoBox = wx.MessageDialog(
            None, 'Are you sure you want to Quit?', 'Question', wx.YES_NO)
        yesNoAnswer = yesNoBox.ShowModal()
        yesNoBox.Destroy()
        if yesNoAnswer == wx.ID_YES:
            self.Close()

    def ViewHost(self, e):
        self.Close()

    def CaptureMode(self, e):
        self.statusbar.SetStatusText('Data Capture Mode')
        self.statusbar.SetStatusText('Exit Capture Mode')

    def MonitorMode(self, e):
        self.statusbar.SetStatusText('Data Monitor Mode')
        self.statusbar.SetStatusText('Exit Monitor Mode')

    def on_open_file(self, e):
        with wx.FileDialog(self, "Open a file", wildcard="*.*",
                           style=wx.FD_OPEN | wx.FD_FILE_MUST_EXIST) as fileDialog:
            if fileDialog.ShowModal() == wx.ID_CANCEL:
                return  # User canceled

            file_path = fileDialog.GetPath()
            # wx.MessageBox(f"Selected File: {file_path}", "File Selected", wx.OK | wx.ICON_INFORMATION)
            count = self.read_file_count(file_path)
            wx.MessageBox(f"Highest word Frequency : \n '{count[0][0]}' appeared {count[0][1]} times \n '{count[1][0]}' appeared {count[1][1]} times\n '{count[2][0]}' appeared {count[2][1]} times",
                          "File Selected", wx.OK | wx.ICON_INFORMATION)

    def read_file_count(self, file_path) -> list:
        try:
            with open(file_path, "r+", encoding="utf-8") as file:
                content = file.read()
                self.text_area.SetValue(content)
        except Exception as e:
            wx.MessageBox(f"Error reading file: {
                          str(e)}", "Error", wx.OK | wx.ICON_INFORMATION)
            return []

        first_pass = content.split("\n")
        second_pass = []
        for item in first_pass:
            second_pass += item.split(" ")

        leaderboard = dict()

        for item in second_pass:
            if item in leaderboard:
                leaderboard[item] = leaderboard[item] + 1
            else:
                leaderboard[item] = 1

        leaderboard = sorted(leaderboard.items(), key=lambda item: item[1])
        return leaderboard[len(leaderboard) - 3:]


def main():
    app = wx.App()
    windowClass(None, 0, size=(500, 400))
    app.MainLoop()


if __name__ == "__main__":
    main()
