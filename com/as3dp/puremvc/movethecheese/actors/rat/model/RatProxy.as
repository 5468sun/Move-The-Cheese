package com.as3dp.puremvc.movethecheese.actors.rat.model
{
	import com.as3dp.puremvc.movethecheese.actors.rat.model.vo.RatVO;
	
	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;

	public class RatProxy extends Proxy implements IProxy
	{
		public static const NAME:String = 'RatProxy';
		
		public function RatProxy()
		{
			super(NAME, new RatVO() );
		}
		
		public function get speed():Number
		{
			return vo.speed;
		}
		
		public function set speed( speed:Number ):void
		{
			vo.speed = speed;
		}
		
		private function get vo():RatVO
		{
			return getData() as RatVO;
		}

	}
}