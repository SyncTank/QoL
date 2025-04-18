import wx
from faker import Faker
import random
import datetime
import json
import pandas as pd
import os
import matplotlib.pyplot as plt
from matplotlib.backends.backend_wxagg import FigureCanvasWxAgg as FigureCanvas
from matplotlib.figure import Figure


class windowClass(wx.Frame):
    def __init__(self, *args, **kwargs):
        super(windowClass, self).__init__(*args, **kwargs)
        self.Centre()
        self.basicGUI()
        self.fake = Faker()
        self.users = []
        self.start_date = datetime.datetime(2015, 1, 1, 0, 0)
        self.num_users = 1000
        self.sensors_users = 1000
        self.data = {}
        self.panel = wx.Panel(self)
        self.sizer = wx.BoxSizer(wx.VERTICAL)

    def basicGUI(self):
        menuBar = wx.MenuBar()
        fileButton = wx.Menu()
        statics = wx.Menu()

        generateData = fileButton.Append(
            wx.ID_ANY, 'Generate IOT', 'Generating Data...')

        jsonSave = fileButton.Append(
            wx.ID_ANY, 'Save to JSON', 'Saving JSON...')

        csvSave = fileButton.Append(
            wx.ID_ANY, 'Save to CSV', 'Saving CSV....')

        exitItem = fileButton.Append(wx.ID_EXIT, 'Exit', 'Exit sample ...')

        descriptive = statics.Append(
            wx.ID_ANY, 'Descriptive', 'Data Details')

        plotA = statics.Append(
            wx.ID_ANY, 'Plot A', 'Plot A')

        plotB = statics.Append(
            wx.ID_ANY, 'Plot B', 'Plot B')

        plotC = statics.Append(
            wx.ID_ANY, 'Plot C', 'Plot C')

        menuBar.Append(fileButton, 'File')
        menuBar.Append(statics, 'Statistics')
        self.SetMenuBar(menuBar)

        self.Bind(wx.EVT_MENU, self.Descriptive, descriptive)
        self.Bind(wx.EVT_MENU, self.PlotA, plotA)
        self.Bind(wx.EVT_MENU, self.PlotB, plotB)
        self.Bind(wx.EVT_MENU, self.PlotC, plotC)

        self.Bind(wx.EVT_MENU, self.SaveCSV, csvSave)
        self.Bind(wx.EVT_MENU, self.SaveJSON, jsonSave)
        self.Bind(wx.EVT_MENU, self.GenerateData, generateData)
        self.Bind(wx.EVT_MENU, self.Quit, exitItem)

        self.statusbar = self.CreateStatusBar(1)
        self.statusbar.SetStatusText('Waiting To Start')

        self.SetTitle('Rudy - My App 2025-04-17 ')

        # self.text_area = wx.TextCtrl(panel, pos=(50, 150),
        # size=(300, 100), style=wx.TE_MULTILINE)

        self.Show(True)

    def clearPanel(self):
        if self.sizer:
            while self.sizer.GetChildren():
                child = self.sizer.GetChildren()[0]
                widget = child.GetWindow()
                if widget:
                    self.sizer.Detach(widget)
                    widget.Destroy()

        self.sizer.Clear()
        self.panel.Layout()
        self.panel.Refresh()

    def _render_plot(self, fig):
        self.canvas = FigureCanvas(self.panel, -1, fig)
        self.sizer.Add(self.canvas, 1, wx.EXPAND)
        self.panel.Layout()
        self.sizer.Fit(self.panel)
        self.Fit()

    def get_sensor_data(self, sample_size=None):
        rows = []
        for user in self.users:
            rows.extend(user["sensors"])  # Flatten all sensors
        df = pd.DataFrame(rows)

        # Filter to 6-hour intervals for Plot A/B (if timestamp exists)
        if hasattr(df, 'timestamp'):
            df['timestamp'] = pd.to_datetime(df['timestamp'])
            # Keep 00:00, 06:00, etc.
            df = df[df['timestamp'].dt.hour % 6 == 0]

        # Sample data if requested (for Plot C)
        if sample_size:
            df = df.sample(n=min(sample_size, len(df)), random_state=42)

        return df

    def PlotA(self, e):
        self.clearPanel()
        self.statusbar.SetStatusText('Plot A')
        try:
            df = self.get_sensor_data()  # Already filtered to 6-hour intervals
            fig = Figure(figsize=(10, 6))
            ax = fig.add_subplot(111)

            ax.hist(df['outside_temperature'], bins=50,
                    color='skyblue', edgecolor='black')
            ax.set_title("Outside Temperature (6-Hour Samples)")
            ax.set_xlabel("Temperature")
            ax.set_ylabel("Frequency")

            self._render_plot(fig)

        except Exception as err:
            wx.MessageBox(
                f"No information found:\n\n {err}\n", "Plot A", wx.OK)

    def PlotB(self, e):
        self.clearPanel()
        self.statusbar.SetStatusText('Plot B')
        try:
            df = self.get_sensor_data()
            fig = Figure(figsize=(10, 6))
            sameple_df = df.sample(n=1000, random_state=42).sort_index()
            ax = fig.add_subplot(111)

            ax.plot(sameple_df.index,
                    sameple_df['outside_temperature'],
                    label='Outside Temperature',
                    color='red')

            ax.plot(sameple_df.index,
                    sameple_df['room_temperature'],
                    label='Room Temperature',
                    color='blue')

            ax.set_xlabel("Sample Index")
            ax.set_ylabel("Temperature")

            ax.legend()

            self._render_plot(fig)
        except Exception as err:
            wx.MessageBox(
                f"No information found:\n\n {err}\n", "Plot B", wx.OK)

    def PlotC(self, e):
        self.clearPanel()

        rows = []
        for user in self.users:
            for sensor in user["sensors"]:
                rows.append(sensor)
        df = pd.DataFrame(rows)
        self.statusbar.SetStatusText('Plot C')
        try:
            fig, axs = plt.subplots(2, 2, figsize=(12, 10))

            axs[0, 0].hist(df['outside_temperature'], bins=50,
                           color='red', edgecolor='black')
            axs[0, 0].set_title("Histogram of Outside Temperature")
            axs[0, 0].set_xlabel("Temperature")
            axs[0, 0].set_ylabel("Frequency")

            axs[0, 1].hist(df['room_temperature'], bins=50,
                           color='blue', edgecolor='black')
            axs[0, 1].set_title("Histogram of Room Temperature")
            axs[0, 1].set_xlabel("Temperature")
            axs[0, 1].set_ylabel("Frequency")

            axs[1, 0].hist(df['outside_humidity'], bins=50,
                           color='purple', edgecolor='black')
            axs[1, 0].set_title("Histogram of Outside Humidity")
            axs[1, 0].set_xlabel("Humidity")
            axs[1, 0].set_ylabel("Frequency")

            axs[1, 1].hist(df['room_humidity'], bins=50,
                           color='green', edgecolor='black')
            axs[1, 1].set_title("Histogram of Room Humidity")
            axs[1, 1].set_xlabel("Humidity")
            axs[1, 1].set_ylabel("Frequency")

            self.canvas = FigureCanvas(self.panel, -1, fig)
            self.sizer.Add(self.canvas, 1, wx.EXPAND)

            self.panel.Layout()
            self.sizer.Fit(self.panel)
            self.Fit()
        except Exception as err:
            wx.MessageBox(
                f"No information found:\n\n {err}\n", "Plot C", wx.OK)

    def Descriptive(self, e):
        rows = []
        for user in self.users:
            for sensor in user["sensors"]:
                rows.append(sensor)
        df = pd.DataFrame(rows)

        try:
            wx.MessageBox(
                "Application for descriptive statics for sensor data:\n" +
                f"Amount to pull: {self.num_users}\n" +
                f"Current available users: {len(self.users)}\n" +
                f"{df[['outside_temperature', 'outside_humidity',
                       'room_temperature', 'room_humidity']].describe()}",
                "Description of Data",
                wx.OK)
        except Exception as err:
            wx.MessageBox(
                "Application for descriptive statics for sensor data:\n" +
                f"Amount to pull: {self.num_users}\n" +
                f"Current available users: {len(self.users)}\n" +
                f"No users found: \n\n{err}",
                "Description of Data",
                wx.OK)

    def Quit(self, e):
        yesNoBox = wx.MessageDialog(
            None, 'Are you sure you want to Quit?', 'Question', wx.YES_NO)
        yesNoAnswer = yesNoBox.ShowModal()
        yesNoBox.Destroy()
        if yesNoAnswer == wx.ID_YES:
            self.Close()

    def SaveCSV(self, e):
        self.statusbar.SetStatusText('Saving....')

        with wx.FileDialog(
            self,
            message="Save file as...",
            defaultDir=os.path.dirname(os.path.abspath(__file__)),
            defaultFile="data.csv",
            wildcard="CSV files (*.csv)|*.csv|All files(*.*)|*.*",
            style=wx.FD_SAVE | wx.FD_OVERWRITE_PROMPT
        ) as dlg:
            if dlg.ShowModal() == wx.ID_OK:
                path = dlg.GetPath()

                rows = []
                for user in self.users:
                    user_info = {
                        "firstname": user["firstname"],
                        "lastname": user["lastname"],
                        "age": user["age"],
                        "gender": user["gender"],
                        "username": user["username"],
                        "address": user["address"],
                        "email": user["email"]
                    }
                    for sensor in user["sensors"]:
                        row = user_info.copy()
                        row.update(sensor)
                        rows.append(row)
                df = pd.DataFrame(rows)
                df.to_csv(path, index=False)

        self.statusbar.SetStatusText('Finshed!')

    def SaveJSON(self, e):
        self.statusbar.SetStatusText('Saving....')
        with wx.FileDialog(
            self,
            message="Save file as...",
            defaultDir=os.path.dirname(os.path.abspath(__file__)),
            defaultFile="data.json",
            wildcard="JSON files (*.json)|*.json|All files(*.*)|*.*",
            style=wx.FD_SAVE | wx.FD_OVERWRITE_PROMPT
        ) as dlg:
            if dlg.ShowModal() == wx.ID_OK:
                path = dlg.GetPath()

                with open(path, "w") as file:
                    json.dump(self.data, file, indent=4)

        self.statusbar.SetStatusText('Finshed!')

    def GenerateData(self, e):
        self.statusbar.SetStatusText('Data is happening!')
        progress_dialog = wx.ProgressDialog(
            "Generating Data",
            "Initializing...",
            maximum=self.num_users,
            parent=self,
            style=wx.PD_APP_MODAL | wx.PD_CAN_ABORT | wx.PD_AUTO_HIDE
        )
        try:
            for i in range(self.num_users):
                user = {
                    "firstname": self.fake.first_name(),
                    "lastname": self.fake.last_name(),
                    "age": random.randint(18, 80),
                    "gender": random.choice(["Male", "Female"]),
                    "username": self.fake.user_name(),
                    "address": self.fake.address().replace("\n", ","),
                    "email": self.fake.email()
                }
                sensor_records = []

                for j in range(self.sensors_users):
                    sens_time = self.start_date + datetime.timedelta(hours=j*6)
                    out_temp = round(random.uniform(70, 95), 2)
                    room_temp = round(out_temp - random.uniform(0, 10), 2)

                    out_hum = round(random.uniform(50, 95), 2)
                    room_hum = round(out_hum - random.uniform(0, 10), 2)

                    sensor_record = {
                        "date": sens_time.strftime("%Y-%m-%d"),
                        "time": sens_time.strftime("%H:%M:%S"),
                        "outside_temperature": out_temp,
                        "outside_humidity": out_hum,
                        "room_temperature": room_temp,
                        "room_humidity": room_hum
                    }
                    sensor_records.append(sensor_record)

                user["sensors"] = sensor_records
                self.users.append(user)
                keep, skip = progress_dialog.Update(i + 1, "Processing..")
                if not keep:
                    progress_dialog.Destroy()
                    return

            self.data = {"users": self.users}
        except Exception as err:
            wx.CallAfter(progress_dialog.Destroy)
            wx.MessageBox(f"Error: {err}", "Failure", wx.OK | wx.ICON_ERROR)

        wx.MessageBox("Data has been generated", "Success",
                      wx.OK | wx.ICON_INFORMATION)
        self.statusbar.SetStatusText('Something happened!')


def main():
    app = wx.App()
    windowClass(None, 0, size=(500, 400))
    app.MainLoop()


if __name__ == "__main__":
    main()
