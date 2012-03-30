package com.as3dp.puremvc.movethecheese
{

	import com.as3dp.puremvc.movethecheese.controller.StartupCommand;
	
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	
	public class ApplicationFacade extends Facade
	{
		
		// Notification constants 
		public static const STARTUP:String = 'startup';
		public static const UPDATE:String = 'update';

		public function ApplicationFacade( key:String )
		{
			super(key);	
		}
		
        /**
         * Singleton ApplicationFacade Factory Method
         */
        public static function getInstance( key:String ) : ApplicationFacade 
        {
            if ( instanceMap[ key ] == null ) instanceMap[ key ] = new ApplicationFacade( key );
            return instanceMap[ key ] as ApplicationFacade;
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
        public function startup( app:MoveTheCheese ):void
        {
        	sendNotification( STARTUP, app );
        }
			
	}
}