package screens 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;

	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author Danilo
	 */
	public class GameOverScreen extends MovieClip
	{
		
		public static const RESET:String = "Reset";
		
		public function GameOverScreen() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);

			
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onKeyUp(k:KeyboardEvent):void
		{
			if (k.keyCode == Keyboard.SPACE)
			{
				stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
				trace("ADDED");
				dispatchEvent( new Event(RESET));
				
				
			}
			
		}
	}

}