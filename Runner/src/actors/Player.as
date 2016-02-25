package actors 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import screens.GameScreen;

	/**
	 * ...
	 * @author Danilo
	 */
	public class Player extends MovieClip
	{

		
		private var gravity:Number = 10;
		private var jumpPower:Number = 0;
		private var isJumping:Boolean = false; 

		private var particles:Particle;
		
		public var character:MovieClip = new Character();
		private var ground:int = 480;
		
		
		
		public function Player() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			
			
			addChild(character);
			character.y = ground;
			character.x = 50;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, Jump);
			
			addEventListener(Event.ENTER_FRAME, update);
		}
	
		private function update(e:Event):void
		{
			
			
			
			var oldPosY:int = character.y;
			
			if(isJumping)
			{
				
				character.y -= jumpPower;
				jumpPower -= 2.5;
				
			}

			
			if(character.y + gravity < ground)
				character.y += gravity;
			else
			{
				character.y = ground;
				isJumping = false;
				
			}
			
			
		}
	
		
		private function Jump(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				
				if(!isJumping)
				{
					jumpPower = 35;
					
					isJumping = true;
					
					
					
				}
			}

		}
		
		
		
		
		

		
	}

}