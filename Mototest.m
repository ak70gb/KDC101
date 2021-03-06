%Example for programming the Thorlabs KDC101 with Kinesis in MATLAB, with PRM1-Z8 stage.

%Load assemblies
NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.DeviceManagerCLI.dll');
NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.GenericMotorCLI.dll');
NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.KCube.DCServoCLI.dll');

%Initialize Device List
import Thorlabs.MotionControl.DeviceManagerCLI.*
import Thorlabs.MotionControl.GenericMotorCLI.*
import Thorlabs.MotionControl.KCube.DCServoCLI.*

%Initialize Device List
DeviceManagerCLI.BuildDeviceList();
DeviceManagerCLI.GetDeviceListSize();
SLnoList= Thorlabs.MotionControl.DeviceManagerCLI.DeviceManagerCLI.GetDeviceList();
serialNumbers=cell(ToArray(SLnoList))

%Should change the serial number below to the one being used.
serial_num=serialNumbers{1};
timeout_val=60000;

%Set up device and configuration
device = KCubeDCServo.CreateKCubeDCServo(serial_num);
device.Connect(serial_num);
device.WaitForSettingsInitialized(5000);

% configure the stage
motorSettings = device.LoadMotorConfiguration(serial_num);
motorSettings.DeviceSettingsName = 'PRM1/M-Z8';
% update the RealToDeviceUnit converter
motorSettings.UpdateCurrentConfiguration();

% push the settings down to the device
MotorDeviceSettings = device.MotorDeviceSettings;
device.SetSettings(MotorDeviceSettings, true, false);

device.StartPolling(250);

pause(1); %wait to make sure device is enabled

%Home
device.Home(timeout_val);
fprintf('Motor homed.\n');

%Move to unit 100
device.MoveTo(25, timeout_val);
pause(3);
%Check Position
pos = System.Decimal.ToDouble(device.Position);
%fprintf('The motor position is %d.\n',pos);
str1 = ['Motor @ ',num2str(pos)];
disp(str1);

device.StopPolling()
device.Disconnect()