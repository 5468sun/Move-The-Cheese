package com.as3dp.puremvc.movethecheese.actors.rat.view
{
	import com.as3dp.puremvc.movethecheese.actors.rat.RatFacade;
	import com.as3dp.puremvc.movethecheese.actors.rat.model.RatProxy;
	
	import flash.geom.Point;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;

	public class RatMediator extends Mediator
	{
		public static const NAME:String	= "RatMediator";
		
		private var ratProxy:RatProxy;
		
		public function RatMediator( viewComponent:Rat )
		{
			super(NAME, viewComponent);
		}
		
		override public function listNotificationInterests():Array
		{
			return [ RatFacade.UPDATE ];
		}
		
		override public function handleNotification( note:INotification ):void
		{
			switch ( note.getName() )
			{
				case RatFacade.UPDATE:
					move();
					break;
			}
		}

		
		override public function onRegister( ):void
		{
			draw();
			ratProxy = facade.retrieveProxy( RatProxy.NAME ) as RatProxy;
		}
		
		private function move():void
		{
			var angleToTarget:Number = Math.atan2( rat.cheeseLoc.y - rat.y,
										rat.cheeseLoc.x - rat.x );
			var newLocOffset:Point = Point.polar( ratProxy.speed, angleToTarget );
			rat.x += newLocOffset.x;
			rat.y += newLocOffset.y;
			
			rat.rotation = angleToTarget * 180 / Math.PI;
		}
		
		private function draw():void
		{
			// body
			rat.graphics.moveTo( 15, 0 );
			rat.graphics.beginFill( 0xA9A9A9 );
			rat.graphics.lineTo( -15, -10 );
			rat.graphics.lineTo( -15, 10 );
			rat.graphics.lineTo( 15, 0 );
			// eyes
			rat.graphics.beginFill( 0x606060 );
			rat.graphics.drawCircle( 3, -2, 1.5 );
			rat.graphics.drawCircle( 3, 2, 1.5 );
		}
	
		public function get rat():Rat
		{ 
			return viewComponent as Rat; 
		}
		
	}
}