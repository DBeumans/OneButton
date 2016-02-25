package sound 
{
	
	import flash.media.Sound;
	import flash.events.Event;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import screens.MainMenu;
	import screens.GameScreen;
	import screens.GameOverScreen;
	import screens.IntroScreen;
	
	/**
	 * ...
	 * @author Danilo
	 */
	public class SoundManager 
	{
		
		private var sounds:Sound = new Sound();
		private var _channel:SoundChannel;
		
		
		
		public function SoundManager(main:Main):void
		{
			sounds.load(new URLRequest("http://13103.hosts.ma-cloud.nl/bewijzenmap/periode3/oneButtonGameMusic/3.mp3"));			

			
			
			_channel = sounds.play();
			
			/*
			loadSound("http://13103.hosts.ma-cloud.nl/bewijzenmap/periode3/oneButtonGameMusic/2.mp3");			
			loadSound("http://13103.hosts.ma-cloud.nl/bewijzenmap/periode3/oneButtonGameMusic/3.mp3");	

				*/		
		}
		
	}

}
