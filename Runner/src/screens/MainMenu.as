package screens 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	import flash.ui.Keyboard;
	
	
	
	/**
	 * ...
	 * @author Danilo
	 * ...
	 */
	public class MainMenu extends Fonts
	{
		
		public static const GAME_START:String = "Game Screen";
		
		private var _main:Main;
		
		private var background:MovieClip = new Background_01();
		
		private var distanceText:TextField;
		private var distanceText2:TextField;
		private var distanceTextFont:TextFormat = new TextFormat( "Shablagoo", 24, 0xFFFF00);
		
		private var InstructionText:TextField;
		
		private var score:int = 0;
		private var gamescreen:GameScreen;
		
		public function MainMenu() 
		{

			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			text();

			addChild(background);
			addChild(distanceText);
			addChild(distanceText2);
			addChild(InstructionText);
			
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			this.addEventListener(Event.ENTER_FRAME, Update);
		}
		
		private function text():void
		{
			
			//Distance
			distanceText = new TextField();
			distanceText.embedFonts = true;
			distanceText.autoSize = TextFieldAutoSize.CENTER;
			distanceText.defaultTextFormat = ShablagooFormat;
			distanceText.x = 500;
			distanceText.y = 100;	
			
			//Distance total
			distanceText2 = new TextField();
			distanceText2.embedFonts = true;
			distanceText2.autoSize = TextFieldAutoSize.CENTER;
			distanceText2.defaultTextFormat = ShablagooFormat;
			distanceText2.x = 500;
			distanceText2.y = 300;
			
			//Instruction
			InstructionText = new TextField();
			InstructionText.embedFonts = true;
			InstructionText.autoSize = TextFieldAutoSize.CENTER;
			InstructionText.defaultTextFormat = ShablagooFormat;
			InstructionText.x = 200;
			InstructionText.y = 50;
			InstructionText.text = "Press Space To Jump Over Obstcles.";
			
		}
		
		private function onKeyUp(k:KeyboardEvent):void
		{
			if (k.keyCode == Keyboard.SPACE)
			{
				stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
				trace("ADDED");
				//removeChild(background);
				dispatchEvent( new Event(GAME_START));
				
				
			}
			
		}
		
		private function Update(e:Event):void
		{
			distanceText.text = "Highscore: " +Main.puntenScreen + "M";
			
			

		}
	
	}

}