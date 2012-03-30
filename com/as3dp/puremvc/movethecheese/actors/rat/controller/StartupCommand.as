package com.as3dp.puremvc.movethecheese.actors.rat.controller
{
	import com.as3dp.puremvc.movethecheese.actors.rat.model.RatProxy;
	import com.as3dp.puremvc.movethecheese.actors.rat.view.RatMediator;
	
	import org.puremvc.as3.multicore.interfaces.ICommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

	public class StartupCommand extends SimpleCommand implements ICommand
	{
		override public function execute(note:INotification):void
		{
			var rat:Rat = note.getBody() as Rat;
			facade.registerProxy( new RatProxy() );
			facade.registerMediator( new RatMediator( rat ) );
		}
	}
}