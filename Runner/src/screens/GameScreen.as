package screens 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.text.TextFormat;
	import flash.utils.getTimer;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import actors.Player;
	import screens.Fonts;
	import actors.Particle;

	/**
	 * ...
	 * @author Danilo
	 */
	public class GameScreen extends Fonts
	{
		
		public static const GAME_OVER_SCREEN:String = "Game Over Screen";
		
		
		private var _player:Player;
		private var _particle:Particle;
		private var _main:Main;
		
		private var death:Boolean = false;
		
		private var ScrollSpeed:Number = 8;
		private var objSpeed:int = 15;
		
		public var plays:int = 0;
		
		private var background:Sprite = new Background_01();
		private var background2:Sprite = new Background_02();
		
		private var level2:Sprite = new Level2();
		private var level02:Sprite = new Level02();
		
		private var objecten:Array = [];
		private var object1:Sprite = new Obstalce();
		private var object2:Sprite = new Obstalce2();
		private var object3:Sprite = new Obstalce3();
		private var object4:Sprite = new Obstalce4();

		public var afstand:int = 0;
		
		private var distanceText:TextField;
		private var distanceTextFont:TextFormat = new TextFormat( "Shablagoo", 24, 0xFFFF00);
		
		public function GameScreen() 
		{
			
			plays++;
			_player = new Player();
			
			if (Main.puntenScreen >= 1000)
			{
				background = level2;
				background2 = level02;
				
			}
			
			addChild(background);
			addChild(background2);
			addChild(_player);
			
			fpsCounter();
			
			objecten.push(object1);
			objecten.push(object2);
			objecten.push(object3);
			objecten.push(object4);
			SpawningObjects();
			
			//Text 
			//Distance
			distanceText = new TextField();
			distanceText.embedFonts = true;
			distanceText.autoSize = TextFieldAutoSize.CENTER;
			distanceText.defaultTextFormat = ShablagooFormat;
			distanceText.x = 500;
			distanceText.y = 100;
				
			addChild(distanceText);
		
			background.x = 0;
			background2.x = background.width;
			
			addEventListener(Event.ENTER_FRAME, update); 
			     
		}	
		
		private function SpawningObjects():void
		{
			
			for (var i:int = 0; i < objecten.length; i++)
			{
				var obj:Sprite = objecten[i];
				obj.y = 550;
				addChild(obj);
				
			}
			
			objecten[0].x = 1100;
			objecten[0].y = 550;
				
			objecten[1].x = 1700;
			objecten[1].y = 550;
				
			objecten[2].x = 2400;
			objecten[2].y = 550;
				
			objecten[3].x = 3100;
			objecten[3].y = 550;
			
		}
		
		private function stopObj():void
		{
			objSpeed = 0;
			object1.x -= objSpeed;
			object2.x -= objSpeed;
			object3.x -= objSpeed;
			object4.x -= objSpeed;
			
			
			
		}
		
		private function moveObj():void
		{
			object1.x -= objSpeed;
			object2.x -= objSpeed;
			object3.x -= objSpeed;
			object4.x -= objSpeed;
		
		}

		

		
		private function update(e:Event):void
		{
			
			scoreHandler();
			
			moveObj();
						
			background.x -= ScrollSpeed;
			background2.x -= ScrollSpeed;
			
			checkObj();

			if (background.x < -background.width )
			{
				background.x = background.width- 10;
			}
			
			else if (background2.x < -background2.width)
			{
				background2.x = background2.width - 10;
			}
			//-----------------------------------------------------------------
			var currentTime:Number = (getTimer() - startTime) / 1000;
 
            framesNumber++;
             
            if (currentTime > 1)
            {
                fps.text = "FPS: " + (Math.floor((framesNumber/currentTime)*10.0)/10.0);
                startTime = getTimer();
                framesNumber = 0;
            }   
						
		}
		
		public var startTime:Number;
        public var framesNumber:Number = 0;
        public var fps:TextField = new TextField();
     
        public function fpsCounter():void
        {
            startTime = getTimer();
            addChild(fps);
			fps.x = 200;
 
    
        }
		
		private function checkObj():void
		{
			
			
			if (object1.x <= -100)
			{
				object1.x = Math.random() * 1100 + 1100;
			}
			if (object2.x <= -100)
			{
				object2.x = Math.random() * 1700 + 1700;
			}
			if (object3.x <= -100)
			{
				object3.x = Math.random() * 2400 + 2400;
			}
			if (object4.x <= -100)
			{
				object4.x = Math.random() * 3400 + 3400;
			}
			
			if (!_player.godmode)
			{
				if (object1.hitTestObject(_player.character) || object2.hitTestObject(_player.character) || object3.hitTestObject(_player.character) || object4.hitTestObject(_player.character))
				{
					//stopObj();

					removeEventListener(Event.ENTER_FRAME, update);
					dispatchEvent( new Event(GAME_OVER_SCREEN));
	
				
				}
			}
			
		}
		
		private function scoreHandler():void
		{
			
			afstand += 1;
			
			distanceText.text = "Distance: " + afstand + "M";
				
		}	
		
	}
}