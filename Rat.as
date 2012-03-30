package
{
	import com.as3dp.puremvc.movethecheese.actors.rat.RatFacade;
	import com.as3dp.puremvc.movethecheese.interfaces.IActor;
	import com.as3dp.puremvc.movethecheese.interfaces.IApplicationShell;
	
	import flash.display.Sprite;
	import flash.geom.Point;
	
	import mx.utils.UIDUtil;

	[SWF(frameRate="50", backgroundColor="0xFFFFFF")]
	public class Rat extends Sprite implements IActor
	{
		private var shell:IApplicationShell;
		
		/**
		 * Get unique identifier for this puremvc core
		 */
		private function get key():String
		{
			return 'Rat-' + UIDUtil.getUID(this);
		}
		
		public function setApplicationShell(shell:IApplicationShell):void
		{
			this.shell = shell;
		}
		
		public function init():void
		{
			if ( shell )
			{
				RatFacade.getInstance( this.key ).startup( this );
			}
			else
			{
				throw Error("Set application shell before calling init");
			} 
		}
		
		public function update():void
		{
			RatFacade.getInstance( this.key ).update();
		}
		
		public function get cheeseLoc():Point
		{
			if ( shell )
			{
				return shell.cheeseLoc;
			}
			else
			{
				throw Error('Application shell not set');
			} 
		}
		
	}
}