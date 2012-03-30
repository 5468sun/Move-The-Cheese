package com.as3dp.puremvc.movethecheese.view.components
{
	import flash.display.Sprite;

	public class Cheese extends Sprite
	{
		public function Cheese()
		{
			draw();
		}
		
		private function draw():void
		{
			// triangle
			graphics.moveTo( -30, 0 );
			graphics.beginFill( 0xFFD700 );
			graphics.lineTo( 30, 20 );
			graphics.lineTo( 30, -20 );
			graphics.lineTo( -30, 0 );
			// holes
			graphics.beginFill( 0xFFFFFF );
			graphics.drawCircle( -10, -5, 5 );
			graphics.drawCircle( 10, 10, 6 );
			graphics.drawCircle( 20, -5, 3 );
		}
		
	}
}