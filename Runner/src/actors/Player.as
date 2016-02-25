package actors 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.utils.setInterval;
	
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
		
		private var doubleJump:Boolean = false;
		private var upKeyPressed:Boolean = false

		private var ParticleArray:Array = [];
		
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
			stage.addEventListener(KeyboardEvent.KEY_DOWN, JumpReleased);
			
			addEventListener(Event.ENTER_FRAME, update);
			setInterval(omlmeidingNaarMakeParticalFunction, 10);
		}
		
		private function omlmeidingNaarMakeParticalFunction():void
		{
			makeParticle(7, character.x +14, character.y + 100, 10, 10);
		}
	
		private function update(e:Event):void
		{
			for ( var i:int = 0; i < ParticleArray.length; i++)
			{
				ParticleArray[i].update();
				if (ParticleArray[i].timer == 30)
				{
					removeChild(ParticleArray[i]);
					ParticleArray.splice(i, 1);
				}
			}
			
			
			var oldPosY:int = character.y;
			
			if(isJumping)
			{
				
				character.y -= jumpPower;
				jumpPower -= 2.5;
				
			}
					
			if (upKeyPressed && doubleJump && character.y < ground)
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
					upKeyPressed = true;

					isJumping = true;	
				}
					
		
			}
		}
		
		private function JumpReleased(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				upKeyPressed = false;
			}
		}
		
		
		public function makeParticle(num:int, xPos:int, yPos:int, xSpeed:int, ySpeed:int):void
		{
			for (var i:int = 0; i < num;i++ )
			{
				var part:Particle = new Particle(Math.round(Math.random()) * 10 + 5);
				part.x = xPos;
				part.y = yPos;
				part.xSpeed = xSpeed + Math.random() * 10 - 5;
				part.ySpeed = ySpeed + Math.random() * 10 - 5;
				part.rSpeed = Math.random() * 10 + 20;
				addChild(part);
				ParticleArray.push(part);
				
			}
			
		}

		
	}

}