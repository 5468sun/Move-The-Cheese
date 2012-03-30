package com.as3dp.puremvc.movethecheese.model
{
	import com.as3dp.puremvc.movethecheese.ApplicationFacade;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;

	public class ApplicationProxy extends Proxy implements IProxy
	{
		public static const NAME:String = 'ApplicationProxy';
		
		private var updateTimer:Timer;
		
		public function ApplicationProxy()
		{
			super(NAME, null);
		}
		
		override public function onRegister():void
		{
			updateTimer = new Timer( 20 ); // 20 ticks = 50 events per second
            updateTimer.addEventListener( TimerEvent.TIMER, updateHandler );
            updateTimer.start();
		}
		
		public function updateHandler( event:TimerEvent ):void
		{
			sendNotification( ApplicationFacade.UPDATE ); 
		}
		
		override public function onRemove():void
		{
			updateTimer.stop();
			updateTimer.removeEventListener( TimerEvent.TIMER, updateHandler );		
		}
		
	}
}