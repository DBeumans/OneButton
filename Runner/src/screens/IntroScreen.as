package screens 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	/**
	 * ...
	 * @author Danilo
	 */
	public class IntroScreen extends Fonts
	{
		
		
		private var text:TextField;
		private var text2:TextField;
		private var textFont:TextFormat = new TextFormat( "Shablagoo", 24, 0xFFFF00);
		
		private var textArray:Array = [];
		
		
		public static const HOW_TO:String = "How to play";
		
		public function IntroScreen() 
		{
			text = new TextField();
			text.embedFonts = true;
			text.autoSize = TextFieldAutoSize.CENTER;
			text.defaultTextFormat = ShablagooFormat;
			text.x = 500;
			text.y = 300;
			text.alpha = 1;
			text.text = "Made By : Danilo Beumans";
			
			
			text2 = new TextField();
			text2.embedFonts = true;
			text2.autoSize = TextFieldAutoSize.CENTER;
			text2.defaultTextFormat = ShablagooFormat;
			text2.x = 500;
			text2.y = 200;
			text2.alpha = 1;
			text2.text = "One Button Game...";
			
			
			startUp();
		}
		

	
		
		private function startUp():void
		{
			textArray.push(text);
			textArray.push(text2);
			
			addChild(text);
			addChild(text2);
			
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		private var color:Boolean = true;
		private function update ( e:Event):void
		{
			
			
			//Alpha

			if (!color)
			{
				textArray[0].alpha += .019;
				textArray[1].alpha += .019;
				if (textArray[0].alpha >= 1 )
				{
					color = true;
						
				}
				if (textArray[1].alpha >= 1 )
				{
					color = true;
						
				}
					
			}
				
			else
			{
				textArray[0].alpha -= .019;	
				textArray[1].alpha -= .019;	
				if (textArray[0].alpha <=0 )  
				{
					color = false;
					dispatchEvent(new Event(HOW_TO));
					removeEventListener(Event.ENTER_FRAME, update);
				}
				if (textArray[1].alpha <=0 )  
				{
					color = false;
					
				}
					
			}
			
			
			
			
			
		}
		
	}

}