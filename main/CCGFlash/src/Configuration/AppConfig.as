package Configuration
{
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	import flash.xml.XMLDocument;
	
	public class AppConfig
	{
		private static var AppConfigSettings:Dictionary;
		
		private static var appConfig:AppConfig;
		
		private const ConfigFilePath:String="appConfig.xml";
		
		private function AppConfig()
		{
			var appConfigReq:URLRequest=new URLRequest(ConfigFilePath);
			var appConfigLoader:URLLoader=new URLLoader(appConfigReq);
			var appConfigXml:XML=new XML(appConfigLoader.data);
			AppConfigSettings=new Dictionary();
			for each(var item:XML in appConfig.appConfig)
			{
				AppConfigSettings[item.name]=item.value;
			}
		}
		
		public static function GetAppConfigInstance():AppConfig
		{
			if(appConfig==null)
			{
				appConfig=new AppConfig();
			}
			return appConfig;
		}
		
		public static function GetAppSettings(name:String):String
		{
			return AppConfigSettings[name];
		}
		
	}
}