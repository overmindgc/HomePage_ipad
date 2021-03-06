package com.overmindgc.homepage.views.common
{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import spark.components.TitleWindow;
	
	public class DragWindow extends TitleWindow
	{
		private var _startX: Number;
		private var _startY: Number;
		private var _dragStartX: Number;
		private var _dragStartY: Number;
		private var _isDragging: Boolean = false;
		
		public function DragWindow()
		{
			super();
		}
		
		override public function initialize(): void {
			super.initialize();
			addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
		}
		
		private function handleMouseDown(event: MouseEvent): void {
			var contentPoint: Point = globalToContent(new Point(event.stageX, event.stageY));
			if (contentPoint.y < 0) {
				// While the mouse event is down, we need to capture all move/up events, even
				// if we aren't the target (since the mouse will often move outside of our
				// current bounds).  To do this, we register these listeners with the top-level 
				// SystemManager, and set useCapture to true to get first crack at the events.
				// This is essentially equivalent to the old setCapture() method.
				systemManager.addEventListener(MouseEvent.MOUSE_MOVE, handleMouseMove, true);
				systemManager.addEventListener(MouseEvent.MOUSE_UP, handleMouseUp, true);
				
				_startX = x;
				_startY = y;
				_dragStartX = event.stageX;
				_dragStartY = event.stageY;
				
				// Clear any constraints that might have been set, so we can move around freely.
				clearStyle("left");
				clearStyle("right");
				clearStyle("top");
				clearStyle("bottom");
				clearStyle("horizontalCenter");
				clearStyle("verticalCenter");
				
				_isDragging = true;
			}
		}
		
		private function handleMouseMove(event: MouseEvent): void {
			if (_isDragging) {
				// Don't allow the actual target of the event to handle it.
				event.stopImmediatePropagation();
				move(_startX + event.stageX - _dragStartX, _startY + event.stageY - _dragStartY);
			}
		}
		
		private function handleMouseUp(event: MouseEvent): void {
			if (_isDragging) {
				// Don't allow the actual target of the event to handle it.
				event.stopImmediatePropagation();
				move(_startX + event.stageX - _dragStartX, _startY + event.stageY - _dragStartY);
				systemManager.removeEventListener(MouseEvent.MOUSE_MOVE, handleMouseMove, true);
				systemManager.removeEventListener(MouseEvent.MOUSE_UP, handleMouseUp, true);
				_isDragging = false;
			}
		}
	}
}