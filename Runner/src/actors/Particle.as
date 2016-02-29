package actors 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Danilo
	 */
	public class Particle extends MovieClip
	{
		public var xSpeed:int = 0;
		public var ySpeed:int = 0;
		public var rSpeed:int = 0;
		public var timer:int = 0;
		public var particleColorArray:Array = ["0x808080", "0x00ffff", "0xff00ff", "0xD000000"];
		public var rainbow:Array = ["0xFF0000", "0xEAFF00", "0x09FF00"];
		public var blackAndWhite:Array = ["0xD000000", "0xFFFFFF"];
		
		private var color:Number = randomColor();
		
		public function Particle(size:int) 
		{

			
			this.graphics.beginFill(color, 1);
			this.graphics.drawRect( x - size / 2 , y - size, size, size);
			this.graphics.endFill();
			
		}
		public function update():void
		{
			randomColor();
			x -= xSpeed;
			y -= ySpeed;
			rotation += rSpeed;
			timer++;
			ySpeed -= .5
			timer++;
			if (xSpeed > 0)
			{
				xSpeed -= .5;
			}
			else 
			{
				xSpeed += .5;
			}
		}
		
		private function randomColor():uint
		{
			var returnValue;
			
			
			if (Main.puntenScreen >= 1000)
			{
				returnValue = blackAndWhite;
			}
			if (Main.puntenScreen >= 2000)
			{
				returnValue = particleColorArray;
			}
			if (Main.puntenScreen >= 3000)
			{
				returnValue = rainbow;
			}
			
			return returnValue[int(Math.random() * returnValue.length)];
		}
		
		
		
	}

}