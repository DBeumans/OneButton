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
		
		private var gsCall:Boolean = false;
				
		public static var puntens:int = 0;
		public static var puntenScreen:int = 0;
		
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
			
			else if (puntens > sharedData.data.highScore)
			{
				sharedData.data.highScore = puntens;
			}
			else
			{
				puntenScreen = sharedData.data.highScore;
				
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
			
			if (puntens > sharedData.data.highScore)
			{
				sharedData.data.highScore = puntens;
				sharedData.flush();
				puntenScreen = sharedData.data.highScore;
			}
			else
			{
				
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
			
			puntens = punten;

		}
		
	}
	
}