#Persistent
#SingleInstance
setTimer,code,100
code:
	IfWinExist, Oculus
	{
		Run nircmd setdefaultsounddevice "Headphones"
		Exitapp
	}