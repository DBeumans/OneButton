package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.drm.DRMRemoveFromDeviceGroupContext;
	
	import screens.IntroScreen;
	import screens.MainMenu;
	import screens.GameScreen;
	
	/**
	 * ...
	 * @author Danilo
	 */
	public class Main extends MovieClip
	{
		private var introscreen:MovieClip = new IntroScreen();
		private var mainmenu:MovieClip = new MainMenu();
		private var gamescreens:MovieClip = new GameScreen();
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
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
		
			removeChild(introscreen);
			introscreen.removeEventListener(IntroScreen.HOW_TO, HowtoScreen);
			
			mainmenu = new MainMenu();
			mainmenu.addEventListener(MainMenu.GAME_START, GameScreens);
			addChild(mainmenu);
			
		}
		
		private function GameScreens(e:Event):void
		{
			removeChild(mainmenu);
			mainmenu.removeEventListener(MainMenu.GAME_START, GameScreens);
		
			gamescreens = new GameScreen();
			addChild(gamescreens);
		}
		
	}
	
}