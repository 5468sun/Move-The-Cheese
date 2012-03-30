package com.as3dp.puremvc.movethecheese.view{	import com.as3dp.puremvc.movethecheese.ApplicationFacade;
	import com.as3dp.puremvc.movethecheese.interfaces.IActor;
	import com.as3dp.puremvc.movethecheese.interfaces.IApplicationShell;
	import com.as3dp.puremvc.movethecheese.view.components.Cheese;
	
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.net.URLRequest;
	
	import mx.utils.ObjectUtil;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	public class ApplicationMediator extends Mediator	{		public static const NAME:String	= "ApplicationMediator";				private var cheese:Cheese;		private var ratArray:Array = new Array();	 		public function ApplicationMediator( viewComponent:MoveTheCheese ) 		{			super( NAME, viewComponent );		}				override public function listNotificationInterests():Array		{			return [ ApplicationFacade.UPDATE ];		}				override public function handleNotification( note:INotification ):void		{			switch ( note.getName() )			{				case ApplicationFacade.UPDATE:					for each (var rat:IActor in ratArray)					{					    rat.update();					}					break;			}		}			override public function onRegister( ):void		{			// add the cheese			cheese = new Cheese();			cheese.x = app.stage.stageWidth / 2;			cheese.y = app.stage.stageHeight / 2;			app.addChild( cheese );			// make the cheese draggable			cheese.addEventListener( MouseEvent.MOUSE_DOWN, dragCheese, false, 0, true );			cheese.addEventListener( MouseEvent.MOUSE_UP, dropCheese, false, 0, true );						// create a rat instance			var rat:Rat = new Rat();			rat.x = 10;			rat.y = 10;			app.addChild( rat );			rat.setApplicationShell( app as IApplicationShell );			rat.init();			ratArray.push( rat );						// load a rat swf			var url:String = "Rat.swf";			var loader:Loader = new Loader();			loader.contentLoaderInfo.addEventListener( Event.COMPLETE, completeHandler );			loader.contentLoaderInfo.addEventListener( IOErrorEvent.IO_ERROR, ioErrorHandler );			loader.load( new URLRequest( url ) );		}				public function get cheeseLoc():Point		{			return new Point( cheese.x, cheese.y );		}				private function dragCheese( event:MouseEvent ):void 		{		    cheese.startDrag();		}				private function dropCheese( event:MouseEvent ):void 		{		    cheese.stopDrag();		}				private function completeHandler( event:Event ):void 		{            var rat:DisplayObject = event.target.content as DisplayObject;                 rat.x = 500;            rat.y = 300;            app.addChild( rat );            IActor(rat).setApplicationShell( app as IApplicationShell );			IActor(rat).init();			ratArray.push( rat );        }                private function ioErrorHandler( event:IOErrorEvent ):void         {            trace("ioErrorHandler: " + event.text );        }			public function get app():MoveTheCheese		{ 			return viewComponent as MoveTheCheese; 		}	}}