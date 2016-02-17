package screens 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;
	import flash.text.TextField;
	
	import actors.Player;

	/**
	 * ...
	 * @author Danilo
	 */
	public class GameScreen extends MovieClip
	{
		private var player:MovieClip = new Player();
		
		private var ScrollSpeed:Number = 6;
		
		private var background:Sprite = new Background_01();
		private var background2:Sprite = new Background_02();
		
		private var objecten:Array = [];
		private var object1:Sprite = new Obstalce();
		private var object2:Sprite = new Obstalce2();
		private var object3:Sprite = new Obstalce3();
		private var object4:Sprite = new Obstalce4();

		
		public function GameScreen() 
		{
			addChild(background);
			addChild(background2);
			addChild(player);
			
			fpsCounter();
			
			objecten.push(object1);
			objecten.push(object2);
			objecten.push(object3);
			objecten.push(object4);
			SpawningObjects();
			
			
			
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
				obj.x = Math.random() * 1500 + Math.random() * 200;
				addChild(obj);
				trace(obj.x);
			}
			
			/*
			objecten[0].x = 1100;
			objecten[0].y = 550;
				
			objecten[1].x = 1700;
			objecten[1].y = 550;
				
			objecten[2].x = 2400;
			objecten[2].y = 550;
				
			objecten[3].x = 3100;
			objecten[3].y = 550;
			
			addChild(objecten[0]);
			trace(objecten[0].x);
			addChild(objecten[1]);
			trace(objecten[1].x);
			addChild(objecten[2]);
			trace(objecten[2].x);
			addChild(objecten[3]);
			trace(objecten[3].x);
			
			trace(objecten);
			*/
		}
		
		private function update(e:Event):void
		{
			
			object1.x -= 10;
			object2.x -= 10;
			object3.x -= 10;
			object4.x -= 10;
			
			
			background.x -= ScrollSpeed;
			background2.x -= ScrollSpeed;
			

			
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
		
		
		
	
	}

}