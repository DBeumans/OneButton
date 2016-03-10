package screens 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.filters.GlowFilter;
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
		
		private var background:Sprite = new Background_01();
		
		private var distanceText:TextField;
		private var distanceText2:TextField;
		private var distanceTextFont:TextFormat = new TextFormat( "Shablagoo", 24, 0xFFFF00);
		
		private var InstructionText:TextField;
		private var startText:TextField;
		
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
			
			this.graphics.beginFill(0x81A8B5, 1);
			this.graphics.drawRect(0,0, 1000, 600);
			this.graphics.endFill();
			
			addChild(distanceText);
			addChild(distanceText2);
			addChild(InstructionText);
			addChild(startText);
			
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			this.addEventListener(Event.ENTER_FRAME, Update);
		}
		
		private function text():void
		{
			
			var outline:GlowFilter = new GlowFilter(0x000000, 1.0, 2.0, 2.0, 10);
			
			//HighScore
			distanceText = new TextField();
			distanceText.embedFonts = true;
			distanceText.autoSize = TextFieldAutoSize.CENTER;
			distanceText.defaultTextFormat = ShablagooFormat;
			distanceText.filters = [outline];
			distanceText.x = 150;
			distanceText.y = 100;	
			
			//TotalScore
			distanceText2 = new TextField();
			distanceText2.embedFonts = true;
			distanceText2.autoSize = TextFieldAutoSize.CENTER;
			distanceText2.defaultTextFormat = ShablagooFormat;
			distanceText2.filters = [outline];
			distanceText2.x = 180;
			distanceText2.y = 150;
			
			//Instruction
			InstructionText = new TextField();
			InstructionText.embedFonts = true;
			InstructionText.autoSize = TextFieldAutoSize.CENTER;
			InstructionText.defaultTextFormat = ShablagooFormat;
			InstructionText.filters = [outline];
			InstructionText.x = 300;
			InstructionText.y = 25;
			InstructionText.text = "Press Space To Jump Over Obstcles.";
			
			//Press Space To Start, fade in fade out.
			startText = new TextField();
			startText.embedFonts = true;
			startText.autoSize = TextFieldAutoSize.CENTER;
			startText.defaultTextFormat = ShablagooFormat;
			startText.filters = [outline];
			startText.x = stage.stageWidth/2;
			startText.y = stage.stageHeight/4 * 3;
			startText.text = "Press Space To Start";
			
		}
		
		private function onKeyUp(k:KeyboardEvent):void
		{
			if (k.keyCode == Keyboard.SPACE)
			{
				stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
				removeEventListener(Event.ENTER_FRAME, Update);
				trace("ADDED");
				//removeChild(background);
				dispatchEvent( new Event(GAME_START));
							
			}
			
		}
		private var color:Boolean = true;
		private function Update(e:Event):void
		{
			distanceText.text = "Highscore: " +Main.puntenScreen + "M";
			distanceText2.text = "TotalScore: " +Main.oldscore + "M" + "Total Plays: " + Main.oldPlay;

			//start fade in fade out
			if (color)
			{
				startText.alpha -= .04;	
				if (startText.alpha <= 0) color = false;
				
			}
			else
			{
				startText.alpha += .04;	
				if (startText.alpha >= 1) color = true;
			}
		}
	
	}

}