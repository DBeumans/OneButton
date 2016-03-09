package screens 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.filters.GlowFilter;
	import flash.text.engine.FontPosture;
	import flash.utils.Timer;

	import flash.ui.Keyboard;
	
	import Main;
	/**
	 * ...
	 * @author Danilo
	 */
	public class GameOverScreen extends Fonts
	{
	
		private var continueTextUnlock:Boolean = false;
		private var continuebool:Boolean = false;
		
		private var timer:Timer = new Timer(1000);
		private var seconds:int = 3;
		
		private var YouDied:TextField;
		private var score:TextField;
		private var timeLeft:TextField;
		private var continueText:TextField;
		private var TextFont:TextFormat = new TextFormat( "Shablagoo", 24, 0xFFFF00);
		
		private var textOpslagArray:Array = [];
		
		private var _main:Main;
		
		public static const RESET:String = "Reset";
		
		public function GameOverScreen() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			timer.start();
			
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
			text();
			
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function timerHandler(e:TimerEvent):void
		{           

			var second = timer.currentCount % 60;
			if(second < 10)
				second = '0'+second;
				seconds --;
			if (second >= 3)
			{
				timer.stop();
				timerComplete();
			}
			var timeElapsed = second;
			timeLeft.text = " " + seconds;
}
		
		private function timerComplete():void
		{
			addChild(continueText);
			continuebool = true;
		}
		
		private function text():void
		{
			var outline:GlowFilter = new GlowFilter(0x000000, 1.0, 2.0, 2.0, 10);
			//YouDied
			YouDied = new TextField();
			YouDied.embedFonts = true;
			YouDied.autoSize = TextFieldAutoSize.CENTER;
			YouDied.defaultTextFormat = ShablagooFormat;
			YouDied.filters = [outline];
			YouDied.x = stage.stageWidth/2;
			YouDied.y = stage.stageHeight / 4;
			
			//Score 
			score = new TextField();
			score.embedFonts = true;
			score.autoSize = TextFieldAutoSize.CENTER;
			score.defaultTextFormat = ShablagooFormat;
			score.filters = [outline];
			score.x = stage.stageWidth/2;
			score.y = stage.stageHeight / 4 + 50;
			
			//Time Left
			timeLeft = new TextField();
			timeLeft.embedFonts = true;
			timeLeft.autoSize = TextFieldAutoSize.CENTER;
			timeLeft.defaultTextFormat = ShablagooFormat;
			timeLeft.filters = [outline];
			timeLeft.x = stage.stageWidth/2;
			timeLeft.y = stage.stageHeight / 3 + stage.stageHeight / 4 - 50;
			
			//Continue
			continueText = new TextField();
			continueText.embedFonts = true;
			continueText.autoSize = TextFieldAutoSize.CENTER;
			continueText.defaultTextFormat = ShablagooFormat;
			continueText.filters = [outline];
			continueText.x = stage.stageWidth/2;
			continueText.y = stage.stageHeight / 2 + stage.stageHeight / 4;
			continueText.text = "Press Space To Continue!";
			
			//set text
			YouDied.text = "You died!";
			
			score.text = "Score: " + Main.deadscore + "M";
			
			
			
			
			//addChild Text
			
			addChild(YouDied);
			addChild(score);
			addChild(timeLeft);
			//addChild(continueText);
			
			textOpslagArray.push(YouDied);
			textOpslagArray.push(score);
			textOpslagArray.push(timeLeft);
			textOpslagArray.push(continueText);
		}
		
		private var color:Boolean = true;
		private function update(e:Event):void
		{
				
			
			timeLeft.text = "Time Left to continue: " + seconds;
			
			//start fade in fade out
			if (color)
			{
				continueText.alpha -= .04;	
				if (continueText.alpha <= 0) color = false;
				
			}
			else
			{
				continueText.alpha += .04;	
				if (continueText.alpha >= 1) color = true;
			}
			
		}
		
		private function onKeyUp(k:KeyboardEvent):void
		{
			if (continuebool)
			{
				if (k.keyCode == Keyboard.SPACE)
				{
					for (var i:int = 0; i < textOpslagArray.length; i++)
					{
						var removeText:TextField = textOpslagArray[i];
						removeChild(removeText);
					}
					removeEventListener(Event.ENTER_FRAME, update);
					stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
					trace("ADDED");
					dispatchEvent( new Event(RESET));
				}	
			}
			
			
			
		}
	}

}