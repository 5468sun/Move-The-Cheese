package com.as3dp.puremvc.movethecheese.actors.rat
{
	import com.as3dp.puremvc.movethecheese.actors.rat.controller.StartupCommand;
	
	import org.puremvc.as3.multicore.patterns.facade.Facade;

	public class RatFacade extends Facade
	{
		// Notification constants 
		public static const STARTUP:String = 'startup';
		public static const UPDATE:String = 'update';
		
		public function RatFacade(key:String)
		{
			super(key);
		}
		
		/**
         * Singleton ApplicationFacade Factory Method
         */
        public static function getInstance( key:String ) : RatFacade 
        {
            if ( instanceMap[ key ] == null ) instanceMap[ key ] = new RatFacade( key );
            return instanceMap[ key ] as RatFacade;
        }
        
	    /**
         * Register Commands with the Controller 
         */
        override protected function initializeController( ) : void 
        {
            super.initializeController();            
            registerCommand( STARTUP, StartupCommand );
        }
        
        /**
         * Application startup
         */  
        public function startup( rat:Rat ):void
        {
        	sendNotification( STARTUP, rat );
        }
        
        public function update():void
        {
        	sendNotification( UPDATE );
        }
		
	}
}