package sound 
{
	
	import actors.Player;
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
	import Main;
	
	/**
	 * ...
	 * @author Danilo
	 */
	public class SoundManager 
	{
		
		private var sounds:Sound = new Sound();
		private var trans:SoundTransform = new SoundTransform(0.5,0); 
		private var _channel:SoundChannel;
		
		
		
		private var player:Player;
		
		public function SoundManager(main:Main):void
		{
			sounds.load(new URLRequest("http://13103.hosts.ma-cloud.nl/bewijzenmap/periode3/oneButtonGameMusic/3.mp3"));			

			//jump.load(new URLRequest("../lib/assets/Sounds/jump.wav"));
			
			_channel = sounds.play(0,1,trans);
			
			/*
			loadSound("http://13103.hosts.ma-cloud.nl/bewijzenmap/periode3/oneButtonGameMusic/2.mp3");			
			loadSound("http://13103.hosts.ma-cloud.nl/bewijzenmap/periode3/oneButtonGameMusic/3.mp3");	

				*/		
		}
		
	}

}
