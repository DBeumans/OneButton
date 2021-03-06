package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.SharedObject;

	import screens.IntroScreen;
	import screens.MainMenu;
	import screens.GameScreen;
	import screens.GameOverScreen;
	import sound.SoundManager;
	
	import actors.Player;
	
	/**
	 * ...
	 * @author Danilo
	 */
	public class Main extends MovieClip
	{
		private var introscreen:IntroScreen;
		private var mainmenu:MainMenu;
		private var gamescreens:GameScreen;
		private var gameOverScreen:GameOverScreen;
		private var soundManager:SoundManager;	
		private var _player:Player;
		
		private var gsCall:Boolean = false;
				
		public static var deadscore:int = 0;
			
		public static var puntens:int = 0;
		public static var puntenScreen:int = 0;
		public static var newscore:int = 0;
		public static var oldscore:int = 0;
		public static var newPlay:int = 0;
		public static var oldPlay:int = 0;
		
		public static var puntensScoreArray:Array = [];
		
		public static var sharedData:SharedObject = SharedObject.getLocal("scoreSave");
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			
			// entry point
			soundManager = new SoundManager(this);
			
			
			
			if (sharedData.data.highScore == null)
			{
				sharedData.data.highScore = 0;
			}
			
			if (sharedData.data.totalPlays == null)
			{
				sharedData.data.totalPlays = 0;
			}
			
			if (sharedData.data.totalScore == null)
			{
				sharedData.data.totalScore = 0;
			}
			
			
			
			if (puntens > sharedData.data.highScore)
			{
				sharedData.data.highScore = puntens;
			}
			

			
			else
			{
				puntenScreen = sharedData.data.highScore;
				oldscore = sharedData.data.totalScore;
				oldPlay = sharedData.data.totalPlays;
				
			}
			
			
			introScreen();
			
		}
		
		private function introScreen():void
		{
			
			introscreen = new IntroScreen();
			addChild(introscreen);
			
			introscreen.addEventListener(IntroScreen.HOW_TO, HowtoScreen);
		}
		
		private function HowtoScreen(e:Event):void
		{
			if (this == null)
			{
				removeChild(introscreen);
				introscreen.removeEventListener(IntroScreen.HOW_TO, HowtoScreen);
			}
			
			mainmenu = new MainMenu();
			mainmenu.addEventListener(MainMenu.GAME_START, GameScreens);
						
			addChild(mainmenu);
			
			
			oldscore += newscore;
			oldPlay += newPlay;
			sharedData.data.totalPlays = oldPlay;
			sharedData.data.totalScore = oldscore;
			sharedData.flush();
			
			if (puntens > sharedData.data.highScore)
			{
				sharedData.data.highScore = puntens;
				
				sharedData.flush();
	 			puntenScreen = sharedData.data.highScore;
			}
			
		}
		
		private function GameScreens(e:Event):void
		{
			removeChild(mainmenu);
			mainmenu.removeEventListener(MainMenu.GAME_START, GameScreens);
			
			gamescreens = new GameScreen();
					
			
			
			addChild(gamescreens);
			this.addEventListener(Event.ENTER_FRAME, Update);
			gamescreens.addEventListener(GameScreen.GAME_OVER_SCREEN, GameOver);
		}
		
		private function GameOver(e:Event):void
		{
			
			this.removeEventListener(Event.ENTER_FRAME, Update);
			removeChild(gamescreens);
			gamescreens.removeEventListener(GameScreen.GAME_OVER_SCREEN, GameOver);
			
			
			
			gameOverScreen = new GameOverScreen();
			gameOverScreen.addEventListener(GameOverScreen.RESET, HowtoScreen);
			addChild(gameOverScreen);
		}
		
		private function Update(e:Event):void
		{
			var punten:int = gamescreens.afstand;
			var Plays:int = gamescreens.plays;
			var deadScore:int = gamescreens.afstand;
			
			deadscore = deadScore;
			puntens = punten;
			newscore = punten;
			newPlay = Plays;



		}
		
	}
	
}