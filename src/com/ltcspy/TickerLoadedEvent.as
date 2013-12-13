package com.ltcspy
{
	import com.ltcspy.vo.TickerVO;
	
	import flash.events.Event;

	public class TickerLoadedEvent extends Event
	{
		public static const NAME:String = "TICKERRECEIVED";
		public var payload:TickerVO;
		public function TickerLoadedEvent(loadedData:Object)
		{
			payload = new TickerVO(loadedData);
			super(NAME);
		}
	}
}