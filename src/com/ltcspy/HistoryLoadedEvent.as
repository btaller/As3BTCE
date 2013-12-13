package com.ltcspy
{
	import com.ltcspy.vo.TradeHistoryVO;
	
	import flash.events.Event;

	public class HistoryLoadedEvent extends Event
	{
		public static const NAME:String = "HISTORYRECEIVED";
		public var payload:TradeHistoryVO;
		public function HistoryLoadedEvent(loadedData:Object)
		{
			payload = new TradeHistoryVO(loadedData);
			super(NAME);
		}
	}
}