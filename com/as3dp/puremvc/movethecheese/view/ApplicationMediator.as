package com.as3dp.puremvc.movethecheese.view
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
	public class ApplicationMediator extends Mediator