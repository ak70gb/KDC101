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
KDC101 = KCubeDCServo.CreateKCubeDCServo(serial_num);
KDC101.Connect(serial_num);
KDC101.WaitForSettingsInitialized(5000);

% configure the stage
motorSettings = KDC101.LoadMotorConfiguration(serial_num);
motorSettings.DeviceSettingsName = 'PRM1/M-Z8';
% update the RealToDeviceUnit converter
motorSettings.UpdateCurrentConfiguration();

% push the settings down to the device
MotorDeviceSettings = KDC101.MotorDeviceSettings;
KDC101.SetSettings(MotorDeviceSettings, true, false);

KDC101.StartPolling(250);

pause(1); %wait to make sure device is enabled
KDC101home(KDC101,timeout_val);
%KDC101moveto(KDC101,25,timeout_val);

