package screens 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Danilo
	 */
	public class Fonts extends MovieClip
	{

		[Embed(source = "../../lib/font/VinegarStroke.ttf",
			fontName = "VinegarStroke",
			mimeType = "application/x-font", 
			fontWeight="normal", 
			fontStyle="normal", 		
			advancedAntiAliasing="true", 
			embedAsCFF = "false")]			
			private var VinegarStrokeFont:Class;
		
			
		[Embed(source = "../../lib/font/shablagoo.ttf",
			fontName = "Shablagoo",
			mimeType = "application/x-font", 
			fontWeight="normal", 
			fontStyle="normal", 		
			advancedAntiAliasing="true", 
			embedAsCFF = "false")]			
			private var ShablagooFont:Class;
		
			protected var textFormat:TextFormat;
			protected var subFormat:TextFormat;
			protected var ShablagooFormat:TextFormat;
			protected var VinegarStrokeFormat:TextFormat;
		
		public function Fonts() 
		{
			textFormat = new TextFormat();
			textFormat.font = "Assasin";
			textFormat.size = 170;
			textFormat.color = 0xffffff;
			
			
			subFormat = new TextFormat();
			subFormat.font = "Assasin";
			subFormat.size = 20;
			subFormat.color = 0xff0000;

			
			ShablagooFormat = new TextFormat();
			ShablagooFormat.font = "VinegarStroke";
			ShablagooFormat.size = 40;
			ShablagooFormat.color = 0xFFFF00;
			
			VinegarStrokeFormat = new TextFormat();
			VinegarStrokeFormat.font = "VinegarStroke";
			VinegarStrokeFormat.size = 40;
			VinegarStrokeFormat.color = 0xFFFF00;
		
		}
		
	}

}