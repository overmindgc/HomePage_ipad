package com.overmindgc.homepage.utils
{
	import com.overmindgc.homepage.views.comps.DockButton;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import mx.controls.Alert;

	public class AppDataUtil
	{
		/**底部dock应用图标数据*/
		public static var dockAppXml:XML;
		/**桌面应用图标数据*/
		public static var tableAppXml:XML;
		
		/**
		 * 从数据源加载应用数据
		 * */
		public static function loadAppData():void
		{
			/**按钮数据加载器*/
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE,function(evt:Event):void
			{
				var xml:XML = XML((evt.currentTarget as URLLoader).data);
				dockAppXml = XMLList(xml.dock)[0];
				tableAppXml = XMLList(xml.table)[0];
			});
			loader.addEventListener(IOErrorEvent.IO_ERROR, function(event:IOErrorEvent):void{
				Alert.show("加载应用数据配置文件失败！","错误");
			});
			loader.load(new URLRequest("data/AppList.xml"));
		}
		
		/**转换应用xml数据为图标按钮对象*/
		public static function coventXmlDataToButton(xml:XML):DockButton
		{
			var appBtn:DockButton = new DockButton();
			appBtn.appFileName = xml.@fileName;
			appBtn.iconSource = Consts.ICON_ROOT_FOLDER + xml.@icon;
			appBtn.iconText = xml.text();
			return appBtn;
		}
	}
}