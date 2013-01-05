/**
 * 功能：事件触发器,简单封装下EventBus，便于调用，组件派发侦听事件直接通过的是AppDispatcher，通过这个又间接的调用了EventBus类
 * */
package com.overmindgc.homepage.events
{
	import flash.events.Event;

	public class AppDispatcher
	{
		public static function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void 
		{
			EventBus.getInstance().addEventListener(type, listener, useCapture, priority, useWeakReference);
		}		    
		
		public static function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void 
		{
			EventBus.getInstance().removeEventListener(type, listener, useCapture);
		}		    
		
		public static function dispatchEvent(event:Event):Boolean 
		{
			var eventBase:EventBus = EventBus.getInstance();
			return eventBase.dispatchEvent(event);
		}
	}
}