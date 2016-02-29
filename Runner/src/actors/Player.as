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
		private var jumpKracht:Number = 0;
		private var jumpCounter:int = 0;
		
		private var jumpAble:Boolean = true;
		
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
			setInterval(MakeParticalFunction, 10);
			
		}
		
		private function MakeParticalFunction():void
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
			
			if (character.y + gravity <= 300)
			{
				
				jumpAble = false;
				character.y += gravity;
			
			}
			
					
			if (character.y + gravity < ground)
			{
							
				character.y += gravity;
				
			}
			
			

			else
			{
				character.y = ground;
				isJumping = false;
				jumpAble = true;
				jumpCounter = 0;
			}
			
			
		}
	
		
		private function Jump(e:KeyboardEvent):void
		{
			if (jumpAble)
			{
				if (e.keyCode == Keyboard.SPACE)
				{
					
					jumpKracht = 0;
					jumpKracht ++;
					jumpPower = jumpKracht + 35;
		
				}
			}
		}
		
		private function JumpReleased(e:KeyboardEvent):void
		{
			if (jumpAble)
			{
				if (e.keyCode == Keyboard.SPACE)
				{
					if(!isJumping)
					{
						if (jumpCounter == 2)
						{
						
						}
						else
						{
						jumpCounter ++;
						trace(jumpKracht);
						isJumping = true;	
						
						}
					
					}
					
				}
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