/**
 * EventBus集中处理组件之间的通信，像自定义事件的触发和侦听都通过EventBus来管理。EventBus是全局化的，一个程序中只需要一个
 * EventBus实例即可，为确保唯一性，这里采用单例模式。
 */
package com.overmindgc.homepage.events
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class EventBus extends EventDispatcher
	{
		private static var _eventBus:EventBus; //eventbus实例
		private static var isSingleton:Boolean = false; //是否是单例
		
		public function EventBus()
		{
			if (!isSingleton) //如果不是单例
				throw new Error( "EventBus只须实例化一次！");
		}
		
		/**
		 * 获得实例
		 * */
		public static function getInstance():EventBus 
		{
			if ( _eventBus == null) 
			{
				isSingleton = true;
				_eventBus = new EventBus();
				isSingleton = false; 
			}
			return _eventBus;
		}
		
		/**
		 * 提供一个快捷的基本触发函数，不需要携带数据的自定义事件可以通过这个触发，type为自定义的事件类型
		 */
		public function dispatch(type:String):Boolean 
		{
			return dispatchEvent(new Event(type));
		}
	}
}