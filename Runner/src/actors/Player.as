package actors 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
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
		private var trans:SoundTransform = new SoundTransform(0.,0); 
		private var _channel:SoundChannel;
		
		public var godmode:Boolean = false;
		
		private var voetSpeed:int = 10;
		
		private var gravity:Number = 10;
		private var jumpPower:Number = 0;
		private var isJumping:Boolean = false; 
		private var jumpKracht:Number = 0;
		private var jumpCounter:int = 0;
		
		public var jumpAble:Boolean = true;
		public var playerDeath:Boolean = false;
		
		// Array
		private var cosmeticArray:Array = [];
		private var WingsArray:Array = [];
		private var ParticleArray:Array = [];
		
		private var particles:Particle;
		
		// Characters
		public var character_default:MovieClip = new Character();
		public var character_blue:MovieClip = new Character_blue();
		public var character_green:MovieClip = new Character_green();
		public var character_purple:MovieClip = new Character_purple();
		public var character_white:MovieClip = new Character_white();
		public var character_yellow:MovieClip = new Character_yellow();
		
		public var character_voet:MovieClip = new Voet();
		public var character_voet2:MovieClip = new Voet();
		// Cosmetics
		
		// Hats
		public var hat_default:MovieClip = new Hat_Default();
		public var hat_blue:MovieClip = new Hat_Blue();
		public var hat_green:MovieClip = new Hat_Green();
		//Wings
		public var wings:MovieClip = new Wings();
		public var wings_2:MovieClip = new Wings_2();
		public var wings_3:MovieClip = new Wings_3();
		public var wings_4:MovieClip = new Wings_4();
		
		public var character:MovieClip = character_default;
		public var costmetic:MovieClip = hat_default;
		public var cosmeticWings:Sprite;
		
		public var ground:int = 480;
				
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
			
			character_voet.x = character.x+20;
			character_voet.y = character.y +90;
			addChildAt(character_voet, 1);
			
			character_voet2.x = character_voet.x + 60;
			character_voet2.y = character_voet.y - 10;
			addChildAt(character_voet2, 1);
			
		}
		
		
		private function checkCosmetics():void
		{
			
			cosmeticArray.push(hat_default);
			cosmeticArray.push(hat_blue);
			cosmeticArray.push(hat_green);
			WingsArray.push(wings);
			WingsArray.push(wings_2);
			WingsArray.push(wings_3);
			WingsArray.push(wings_4);
			for (var i :int = 0; i < cosmeticArray.length; i++)
			{
				var Costmetic:MovieClip = cosmeticArray[i];
				costmetic = Costmetic;
				costmetic.x = character.x - 20;
				costmetic.y = character.y - 52;
				//addChild(costmetic);
				if (Main.puntenScreen >= 1000)
				{
					costmetic = hat_default;
					addChild(costmetic);
				}
				if (Main.puntenScreen >= 2000)
				{
					removeChild(costmetic);
					costmetic = hat_blue;
					addChild(costmetic);
				}
				if (Main.oldscore >= 30000)
				{
					removeChild(costmetic);
					costmetic = hat_default;
					addChild(costmetic);
				}
			}
			
			for (var j:int = 0; j < WingsArray.length; j++)
			{
				var Costmetic2:MovieClip = WingsArray[j];
				cosmeticWings = Costmetic2;
				cosmeticWings.x = character.x + 40;
				cosmeticWings.y = character.y;
				if (Main.puntenScreen >= 0)
				{
					cosmeticWings = wings;
					addChildAt(cosmeticWings, 0);
				}
				if (Main.puntenScreen >= 1200)
				{
					removeChild(cosmeticWings);
					cosmeticWings = wings_2;
					addChildAt(cosmeticWings, 0 );
				}
				if (Main.puntenScreen >= 2500)
				{
					removeChild(cosmeticWings);
					cosmeticWings = wings_3;
					addChildAt(cosmeticWings, 0 );
				}
				if (Main.puntenScreen >= 4000)
				{
					removeChild(cosmeticWings);
					cosmeticWings = wings_4;
					addChildAt(cosmeticWings, 0 );
				}
				
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
				
				addChild(costmetic);

				
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
			makeParticle(5, character.x +14, character.y + 100, 10, 10);
		}
		
		private function update(e:Event):void
		{
			
			character_voet.rotationZ += voetSpeed;
			character_voet2.rotationZ += voetSpeed;

			for ( var i:int = 0; i < ParticleArray.length; i++)
			{
				ParticleArray[i].update();
				if (ParticleArray[i].timer == 30)
				{
					removeChild(ParticleArray[i]);
					ParticleArray.splice(i, 1);
				}
			}
	
			//var oldPosY:int = character.y;
			
			if(isJumping)
			{
				
				character.y -= jumpPower;
				costmetic.y -= jumpPower;
				cosmeticWings.y -= jumpPower;
				character_voet.y -= jumpPower;
				character_voet2.y -= jumpPower;
				jumpPower -= 2.5;
				
			}
			
			if (character.y + gravity <= 300)
			{
				
				jumpAble = false;
				character.y += gravity;
				costmetic.y += gravity;
				cosmeticWings.y += gravity;
				character_voet.y += gravity;
				character_voet2.y += gravity;
			
			}
						
			if (character.y + gravity < ground)
			{
							
				character.y += gravity;
				costmetic.y += gravity;
				cosmeticWings.y += gravity;
				character_voet.y += gravity;
				character_voet2.y += gravity;
				
			}

			else
			{
				character.y = ground;
				costmetic.y = character.y - 35 ;
				cosmeticWings.y = character.y + 30;
				character_voet.y = character.y + 90;
				character_voet2.y = character_voet.y - 10;
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
				var part:Particle = new Particle(Math.round(Math.random()) * 5 + 5);
				part.x = xPos;
				part.y = yPos;
				part.xSpeed = xSpeed + Math.random() * 10 - 5;
				part.ySpeed = ySpeed + Math.random() * 5- 5;
				part.rSpeed = Math.random() * 10 + 20;
				addChildAt(part,0);
				ParticleArray.push(part);
				
			}
			
		}
	
	}

}