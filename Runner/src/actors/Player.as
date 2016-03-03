package actors 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.net.drm.DRMRemoveFromDeviceGroupContext;
	import flash.ui.Keyboard;
	import flash.utils.setInterval;
	
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	import screens.GameScreen;

	/**
	 * ...
	 * @author Danilo
	 */
	public class Player extends MovieClip
	{

		private var jump:Sound = new Sound();
		private var trans:SoundTransform = new SoundTransform(0.2,0); 
		private var _channel:SoundChannel;
		
		public var godmode:Boolean = false;
		
		private var gravity:Number = 10;
		private var jumpPower:Number = 0;
		private var isJumping:Boolean = false; 
		private var jumpKracht:Number = 0;
		private var jumpCounter:int = 0;
		
		public var jumpAble:Boolean = true;
		
		// Array
		private var cosmeticArray:Array = [];
		private var ParticleArray:Array = [];
		
		private var particles:Particle;
		
		// Characters
		public var character_default:MovieClip = new Character();
		public var character_blue:MovieClip = new Character_blue();
		public var character_green:MovieClip = new Character_green();
		public var character_purple:MovieClip = new Character_purple();
		public var character_white:MovieClip = new Character_white();
		public var character_yellow:MovieClip = new Character_yellow();
		
		// Cosmetics
		
		// Hats
		
		public var hat_default:MovieClip = new Hat_Default();
		
		public var character:MovieClip = character_default;
		
		private var ground:int = 480;
		
		
		
		public function Player() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			
			//character = character_default;
			
			jump.load(new URLRequest("../lib/assests/Sounds/jump.mp3"));
			
			
			
			//addChild(character);
			//character.y = ground;
			//character.x = 50;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, Jump);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, JumpReleased);
			
			checkSkin();
			checkCosmetics();
			
			addEventListener(Event.ENTER_FRAME, update);
			setInterval(MakeParticalFunction, 10);
			
		}
		
		private function checkCosmetics():void
		{
			cosmeticArray.push(hat_default);
			for (var i :int = 0; i < cosmeticArray.length; i++)
			{
				var Costmetic:MovieClip = cosmeticArray[i];
				Costmetic.x = character.x - 20;
				Costmetic.y = character.y - 52;
				addChild(Costmetic);
			}
		}
		
		private function checkSkin():void
		{
			character.x = 50;
			character.y = ground;
			
			if (Main.puntenScreen >= 0)
			{
				addChild(character);
				character.x = 50;
				character.y = ground;
			}
			if (Main.puntenScreen >= 1000)
			{
				removeChild(character);
				character = character_blue;
				addChild(character);
				character.x = 50;
				character.y = ground;
				
			}
			
			if (Main.puntenScreen >= 2000)
			{
				removeChild(character);
				character = character_green;
				addChild(character);
				character.x = 50;
				character.y = ground;
				
			}
			
			if (Main.puntenScreen >= 3000)
			{
				removeChild(character);
				character = character_purple;
				addChild(character);
				character.x = 50;
				character.y = ground;
				
			}
			
			if (Main.puntenScreen >= 4000)
			{
				removeChild(character);
				character = character_white;
				addChild(character);
				character.x = 50;
				character.y = ground;
				
			}
			
			
			
			
			
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
			if (e.keyCode == Keyboard.F)
			{
				godmode = true;
			}
			if (jumpAble)
			{
				if (e.keyCode == Keyboard.SPACE)
				{
					
					jumpKracht = 0;
					jumpKracht ++;
					jumpPower = jumpKracht + 35;
					_channel = jump.play(0, 1, trans);
					
		
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