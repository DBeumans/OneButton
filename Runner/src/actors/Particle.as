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

		
		
		public function Particle(size:int) 
		{
			this.graphics.beginFill(0x808080, 1);
			this.graphics.drawRect( x - size / 2 , y - size, size, size);
			this.graphics.endFill();
			
		}
		public function update():void
		{
			
			
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
		
		
		
	}

}