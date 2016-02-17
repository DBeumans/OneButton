package actors 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	/**
	 * ...
	 * @author Danilo
	 */
	public class Obstacles extends MovieClip
	{
		
		public var objecten:Array = new Array();
		
		
		
		public function Obstacles() 
		{
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			
			
		}
		
		private function init(e:Event):void
		{
			
			addEventListener(Event.ENTER_FRAME, update);
					
			
			/*
			objecten.push(object1);
			objecten.push(object2);
			objecten.push(object3);
			objecten.push(object4);
			
			SpawningObjects();
			*/
		}

		/*
		private function SpawningObjects():void
		{
			
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
			
		}
		*/
		
		
		private function update(e:Event):void
		{
			/*
			
			
			ObjectsReset();
			*/
		}

	}
}