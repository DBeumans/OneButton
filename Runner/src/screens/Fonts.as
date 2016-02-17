package screens 
{
	import flash.display.MovieClip;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Danilo
	 */
	public class Fonts extends MovieClip
	{
		[Embed(source = "../../lib/font/Assassin.ttf",
			fontName = "Assasin",
			mimeType = "application/x-font", 
			fontWeight="normal", 
			fontStyle="normal", 		
			advancedAntiAliasing="true", 
			embedAsCFF = "false")]			
			private var AssasinFont:Class;
		
			protected var textFormat:TextFormat;
			protected var subFormat:TextFormat;
			protected var AssasinFormat:TextFormat;
		
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
			
			AssasinFormat = new TextFormat();
			AssasinFormat.font = "Assasin";
			AssasinFormat.size = 40;
			AssasinFormat.color = 0xFFFF00;
		
		}
		
	}

}