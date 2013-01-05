package com.overmindgc.homepage.base
{
	import flash.events.Event;
	
	/*************************************************************\
	 * 带数据的事件，需要带数据时请扩展此事件
	 \*************************************************************/
	public class BaseEvent extends Event
	{
		public var data:*;
		
		public function BaseEvent(type:String, data:*=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.data = data;
		}
	}
}