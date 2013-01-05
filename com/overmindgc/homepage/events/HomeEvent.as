package com.overmindgc.homepage.events
{
	import com.overmindgc.homepage.base.BaseEvent;
	
	import flash.events.Event;
	
	/**
	 * 主页自定义事件
	 * */
	public class HomeEvent extends BaseEvent
	{
		/**应用按钮点击事件*/
		public static var APPBUTTON_CLICK:String = "appButtonClick";
		
		/**改变背景颜色事件*/
		public static var CHAGE_BGCOLOR_ONE:String = "changeBgColor_One";
		public static var CHAGE_BGCOLOR_TWO:String = "changeBgColor_Two";
		
		public function HomeEvent(type:String, data:*=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, data, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new HomeEvent(type, data, bubbles, cancelable);
		}
	}
}