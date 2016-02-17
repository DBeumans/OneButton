package screens 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.net.drm.DRMRemoveFromDeviceGroupContext;
	import flash.ui.Keyboard;
	
	
	
	/**
	 * ...
	 * @author Danilo
	 */
	public class MainMenu extends MovieClip
	{
		
		public static const GAME_START:String = "Game Screen";
		
		
		private var background:MovieClip = new Background_01();
		
		
		public function MainMenu() 
		{

			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			
			addChild(background);
			
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onKeyUp(k:KeyboardEvent):void
		{
			if (k.keyCode == Keyboard.SPACE)
			{
				stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
				trace("ADDED");
				dispatchEvent( new Event(GAME_START));
				//removeChild(background);
				
			}
			
		}
		
		
	
	}

}