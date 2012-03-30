package {
	import com.as3dp.puremvc.movethecheese.ApplicationFacade;
	import com.as3dp.puremvc.movethecheese.interfaces.IApplicationShell;
	import com.as3dp.puremvc.movethecheese.view.ApplicationMediator;
	
	import flash.display.Sprite;
	import flash.geom.Point;
	
	import mx.utils.UIDUtil;

	/**
	 * This would be the Document Class in Flash CS3/4
	 */
	[SWF(width="550", height="400", frameRate="50", backgroundColor="0xFFFFFF")]
	public class MoveTheCheese extends Sprite implements IApplicationShell
	{	
		public function MoveTheCheese()
		{
			ApplicationFacade.getInstance( this.key ).startup( this );
		}
		
		/**
		 * Get unique identifier for this puremvc core
		 */
		private function get key():String
		{
			return 'Shell-' + UIDUtil.getUID(this);
		}
		
		public function get cheeseLoc():Point
		{
			var facade:ApplicationFacade = ApplicationFacade.getInstance( this.key );
			var appMediator:ApplicationMediator = facade.retrieveMediator( ApplicationMediator.NAME ) 
														as ApplicationMediator;
			return appMediator.cheeseLoc;
		}
		
	}
}
