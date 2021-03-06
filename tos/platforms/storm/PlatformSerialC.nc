configuration PlatformSerialC
{
	provides
	{
		interface StdControl;
		interface UartStream;
		interface UartByte;
	}
}
implementation
{
	components new Sam4lUSART3C(), RealMainP, PlatformSerialP;

	PlatformSerialP.Init <- RealMainP.PlatformInit;
	PlatformSerialP.UartControl -> Sam4lUSART3C;
    PlatformSerialP -> Sam4lUSART3C.HplSam4lUSART;
	StdControl = PlatformSerialP;
	UartStream = Sam4lUSART3C;
	UartByte = Sam4lUSART3C;
}