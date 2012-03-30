package com.as3dp.puremvc.movethecheese.controller
{
	import com.as3dp.puremvc.movethecheese.model.ApplicationProxy;
	import com.as3dp.puremvc.movethecheese.view.ApplicationMediator;
	
	import org.puremvc.as3.multicore.interfaces.ICommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

	public class StartupCommand extends SimpleCommand implements ICommand
	{
		override public function execute(note:INotification):void
		{
			var app:MoveTheCheese = note.getBody() as MoveTheCheese;
			facade.registerMediator( new ApplicationMediator( app ) );
			facade.registerProxy( new ApplicationProxy() );
		}
	}
}